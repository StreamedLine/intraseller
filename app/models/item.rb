class Item < ApplicationRecord
	has_many :categoryItems
	has_many :categories, :through => :categoryItems
	has_many :itemQuestions
	has_many :questions, :through => :itemQuestions
	has_many :links, as: :linkable
	has_many :tags, as: :tagable

	validates :bhsku, presence: true

	accepts_nested_attributes_for :links, reject_if: proc { |attributes| attributes['url'].blank? }

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
			self[:bhsku] = scrape_hash[:bhsku] if self[:bhsku].blank?
			self[:mfrsku] = scrape_hash[:mfrsku] if self[:mfrsku].blank?
			self[:image] = scrape_hash[:image] if self[:image].blank?
		end
		self
	end

	private

	def scrape_page(url)
		source = open(url).read
		page = Nokogiri::HTML(source)
		scraped = {}
		scraped[:bhsku] = page.at_css('.bh-mfr-numbers .c28').text.gsub(/[[:space:]]|B&H|MFR|#/i, '')
		scraped[:mfrsku] = page.at_css('.mfr-number').text.gsub(/[[:space:]]|B&H|MFR|#/i, '')
		scraped[:image] = page.at_css('#mainImage')[:src]
		scraped
	end

end
