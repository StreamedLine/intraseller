module ApplicationHelper
	def created_at(timestamped_instance)
		timestamped_instance.created_at.strftime('%D')
	end

	def updated_at(timestamped_instance)
		timestamped_instance.updated_at.strftime('%D')
	end
end
