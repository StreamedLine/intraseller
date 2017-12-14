module ItemsHelper
	def regular_or_nested(category)
		if category
			'category_item_form'
		else
			'item_form'
		end
	end
	
	def correct_item_path(partial_vars)
		if partial_vars[:category].present?
			category_item_path(partial_vars[:category], [partial_vars[:item]])
		else
			item_path(partial_vars[:item])
		end
	end
end
