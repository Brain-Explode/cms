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
		@project = @user.projects.create(project_params)

		if @project.save
			redirect_to @project
		else
			render 'new'
		end
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

  def many_users(project_title, email, &block)
    #stuff
  end

  helper_method :many_users

	private

	def project_params
		params.require(:project).permit(:project_title, :file)
	end
end
