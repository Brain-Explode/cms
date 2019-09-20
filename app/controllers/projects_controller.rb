class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def new
		@projects = Project.new
	end

end
