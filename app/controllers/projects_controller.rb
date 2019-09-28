class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def new
		authorize! :new, @project
		@project = Project.new
	end

	def create
		@user = current_user
		@project = @user.projects.build(project_params)

		if @project.save
			redirect_to @project
		else
			render 'new'
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])

		if @project.update(project_params)
			redirect_to @project
		else
			render 'edit'
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.delete

		redirect_to @project
	end

	def show
		@project = Project.find(params[:id])
		@project_error = Project.find(params[:id])
		@task_error = @project_error.tasks.new
		@task_error.user = current_user
	
		if @task_error.save
			redirect_to @project
		else
			render 'show'
		end
	end

	private

	def project_params
		params.require(:project).permit(:project_title)
	end
end
