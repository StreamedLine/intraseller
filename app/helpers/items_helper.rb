module ItemsHelper
	def regular_or_nested(category)
		if category
			'category_item_form'
		else
			'item_form'
		end
	end
	
end
