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
		if url.present? && (self[:bhsku].blank? || self[:mfrsku].blank?)
			scrape_array = scrape_skus(url)
			self[:bhsku] = scrape_array[0] if self[:bhsku].blank?
			self[:mfrsku] = scrape_array[1] if self[:mfrsku].blank?
		end
		self
	end

	private

	def scrape_skus(url)
		source = open(url).read
		page = Nokogiri::HTML(source)
		bhsku = page.at_css('.bh-mfr-numbers .c28').text
		mfrsku = page.at_css('.mfr-number').text
		[bhsku, mfrsku].collect do |sku|
			sku.gsub(/[[:space:]]|B&H|MFR|#/i, '')
		end
	end

end
