class Item < ApplicationRecord
	#COMPARISONS, has_many of itself
	has_many :comparisons
  has_many :compared, :through => :comparisons
	#CATEGORIES AND QUESTIONS
	has_many :categoryItems
	has_many :categories, :through => :categoryItems
	has_many :itemQuestions
	has_many :questions, :through => :itemQuestions
	#POLYMORPHIC ASSOCIATIONS
	has_many :links, as: :linkable
	has_many :tags, as: :taggable
	has_many :bullets, as: :bulletable

	validates :bhsku, {uniqueness: true, presence: true, allow_blank: false}

	accepts_nested_attributes_for :questions, reject_if: proc { |attributes| attributes['content'].blank? }

	def links_attributes=(links_attributes)
		links_attributes.each do |i, link_attributes|
			url = link_attributes[:url]
			self.scrape_for_info(self, url)
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

	def self.find_or_build_item_with_params(item_params)
		if item_params[:links_attributes].present?
			item = self.new(item_params)
			item.scrape_for_info(item, item_params[:links_attributes]['0'][:url]) 
			search_result = self.find_by(bhsku: item[:bhsku], mfrsku: item[:mfrsku])
			if search_result
				search_result.update(item_params)
				search_result
			else
				item
			end
		elsif item_params[:bhsku].present?
			item = Item.find_by(bhsku: item_params[:bhsku]) 
			return item if item
		end
	end

	def scrape_for_info(item, url)
		if url.present? && (item[:title].blank? || item[:bhsku].blank? || item[:mfrsku].blank? || item[:image].blank?)
			scrape_hash = scrape_page(url)
			if scrape_hash
				item[:title] = scrape_hash[:title] #if item[:title].blank?
				item[:bhsku] = scrape_hash[:bhsku] #if item[:bhsku].blank?
				item[:mfrsku] = scrape_hash[:mfrsku] #if item[:mfrsku].blank?
				item[:image] = scrape_hash[:image] #if item[:image].blank?
			end
		end
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
		scraped[:title] = page.at_css('.js-main-product-name').text.gsub(/[[:space:]]/,' ')
		scraped[:bhsku] = page.at_css('.bh-mfr-numbers .c28').text.gsub(/[[:space:]]|B&H|MFR|#/i, '')
		scraped[:mfrsku] = page.at_css('.mfr-number').text.gsub(/[[:space:]]|B&H|MFR|#/i, '')
		scraped[:image] = page.at_css('#mainImage')[:src]
		scraped
	end


end
