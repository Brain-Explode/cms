class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

	before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
		redirect_to projects_url, :alert => exception.message
	end
end
