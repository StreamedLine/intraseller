module SearchHelper
	def result_enhancer(result) 
		if result == 'No results found'
			result 
		else
			link_to(result.title, item_path(result))
		end
	end
end
