class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def new
	end

	def create
		@project = Project.new(project_params)
		@project.save

		redirect_to projects_url
	end

	private
		def project_params
			params.require(:project).permit(:project_title)
		end

end
