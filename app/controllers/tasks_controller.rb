class TasksController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		@task = @project.tasks.create(params[:task].permit(:title, :body))

		redirect_to project_path(@project)
	end
end
