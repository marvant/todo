class TasksController < ApplicationController
	before_filter :authenticate_user!

	def index
		if user_signed_in?
			@user = current_user
			@tasks = @user.tasks
			@completed_tasks = @tasks.where(completed: :true)
			@open_tasks = @tasks.where(completed: :false)
		else
			@errors = 'sign in first'
		end
	end

	def show
		@task = Task.find(params[:id])
	end

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
