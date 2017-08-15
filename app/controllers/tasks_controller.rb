class TasksController < ApplicationController
	before_filter :authenticate_user!
	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		@user = current_user
		@task.user_id = @user.id
		if @task.save
			redirect_to tasks_path
		else
			render 'new'
		end
	end

	private
	def task_params
		params.require(:task).permit(:user_id, :title, :deadline, :completed, :detail)
	end
end
