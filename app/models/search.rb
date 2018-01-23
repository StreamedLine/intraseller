class Search < ApplicationRecord

	def self.search_for(keyword)
		results = []
		results.concat Item.where('bhsku LIKE ?', '%' + keyword + '%')
		results.concat Item.where('title LIKE ?', '%' + keyword + '%')
		if results.length == 0 
			results = ['No results found']
		end 
		results
	end
end
