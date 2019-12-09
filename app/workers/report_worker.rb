class ReportWorker
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform()
		@user = current_user
		@project = @user.projects.create(project_params)

		if @project.save
			redirect_to @project
		else
			render 'new'
		end
	end

end
