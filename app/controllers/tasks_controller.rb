class TasksController < ApplicationController
	before_action :find_project, only: %i(edit update destroy show)
	before_action :find_task, only: %i(edit update destroy show)

	def create
		@project = Project.find(params[:project_id])
		@task = @project.tasks.build(task_params)
		@task.user = current_user
		@task.save

		redirect_to project_path(@project)
	end

	def edit;	end

	def update
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

	def show;	end

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
