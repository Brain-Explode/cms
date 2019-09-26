class CommentsController < ApplicationController
	before_action :find_project, only: %i(edit update destroy show)
	before_action :find_task, only: %i(edit update destroy show)
	before_action :find_comment, only: %i(edit update destroy)

	def create
		@user = current_user
		@project = @user.projects.find(params[:project_id])
		@task = @project.tasks.find(params[:task_id])
		@comment = @task.comments.build(comment_params)

		if @comment.save
			redirect_to ([@project, @task])
		else
			render 'new'
		end
	end

	def show; end

	def edit;	end

	def update
		if @comment.update(comment_params)
			redirect_to ([@project, @task])
		else
			render 'new'
		end
	end

	def destroy
		@comment.delete

		redirect_to ([@project, @task])
	end

	private

	def comment_params
		params.require(:comment).permit(:name, :body)
	end

	def find_project
		@project = Project.find(params[:project_id])
	end

	def find_task
		@task = @project.tasks.find(params[:task_id])
	end

	def find_comment
		@comment = @task.comments.find(params[:id])
	end
end
