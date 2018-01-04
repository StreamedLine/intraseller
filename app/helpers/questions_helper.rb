module QuestionsHelper
	def parent_title(question)
		parent = ''
		if question.categories.count > 0
			parent = question.categories.first.title
		else
			parent = question.items.first.title
		end
	end

	def parent_path(question)
		parents = []
		if question.categories.count > 0
			parents.concat(question.categories)
		else
			parents.concat(question.items)
		end
		send("#{parents[0].class.table_name.singularize}_path", parents[0].id)
	end
end