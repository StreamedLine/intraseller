class Item < ApplicationRecord
	has_many :categoryItems
	has_many :categories, :through => :categoryItems
	has_many :itemQuestions
	has_many :questions, :through => :itemQuestions
	has_many :links, as: :linkable
	has_many :tags, as: :tagable

	validates :bhsku, presence: true

	#accepts_nested_attributes_for :links, reject_if: proc { |attributes| attributes['url'].blank? }

	def links_attributes=(links_attributes)
		links_attributes.each do |i, link_attributes|
			url = link_attributes[:url]
			self.scrape_for_info(url)
			self.links.build(url: url)
		end
	end

	def tags_attributes=(tags_attributes)
		tags_attributes.each do |i, tag_attributes|
			next if tag_attributes[:label].blank?
			if tag_attributes[:id].blank?
				tag = Tag.find_or_create_by(label: tag_attributes[:label])
				self.tags << tag 
			else
				tag = Tag.find(tag_attributes[:id])
				tag.update(label: tag_attributes[:label])
				self.tags << tag
			end
		end
	end

	def scrape_for_info(url)
		if url.present? && (self[:bhsku].blank? || self[:mfrsku].blank? || self[:image].blank?)
			scrape_hash = scrape_page(url)
			if scrape_hash
				self[:bhsku] = scrape_hash[:bhsku] if self[:bhsku].blank?
				self[:mfrsku] = scrape_hash[:mfrsku] if self[:mfrsku].blank?
				self[:image] = scrape_hash[:image] if self[:image].blank?
			end
		end
		self
	end

	def exisitng_or_new
		search_bh = self.class.find_by(bhsku: self.bhsku)
		search_mfr = self.class.find_by(mfrsku: self.mfrsku)
		[search_bh, search_mfr].each do |search_result|
			return search_result if search_result 
		end
		self
	end

	private

	def scrape_page(url)
		begin
			source = open(url).read
		rescue
			return false
		end
		page = Nokogiri::HTML(source)
		scraped = {}
		scraped[:bhsku] = page.at_css('.bh-mfr-numbers .c28').text.gsub(/[[:space:]]|B&H|MFR|#/i, '')
		scraped[:mfrsku] = page.at_css('.mfr-number').text.gsub(/[[:space:]]|B&H|MFR|#/i, '')
		scraped[:image] = page.at_css('#mainImage')[:src]
		scraped
	end


end
