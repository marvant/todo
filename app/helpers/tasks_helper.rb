module TasksHelper
	def past_due?(task)
		if task.deadline >= Date.today
			return false
		else
			return true
		end
	end
end
