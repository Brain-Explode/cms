class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def new
		authorize! :new, @project
		@project = Project.new
	end

	def create
		ReportWorker.perform_async()
		render text: "request added to queue"
	end

	def edit
		authorize! :edit, @project
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
		authorize! :show, @project
		@project = Project.find(params[:id])
	end


	private

	def project_params
		params.require(:project).permit(:project_title, :file)
	end
end
