class TasksController < ApplicationController
	before_action :find_project, only: [:create, :edit, :update, :destroy]
	before_action :find_task, only: [:edit, :update, :destroy]

	def create
		@task = @project.tasks.create(task_params)

		redirect_to project_path(@project)
	end

	def edit
		@task = Task.find(params[:id])
	end


	def update
		@task = Task.find(params[:id])
		if @task.update(task_params)
			redirect_to project_path(@project)
		else
			render 'edit'
		end
	end

	def destroy
		@task.delete

		redirect_to project_path(@project)
	end

	private

	def task_params
		params.require(:task).permit(:title, :body)
	end

	def find_project
		@project = Project.find(params[:project_id])
	end

	def find_task
		@task = @project.tasks.find(params[:id])
	end
end
