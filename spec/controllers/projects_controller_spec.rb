require "rails_helper"

RSpec.describe "Projects", type: :request do
  include Devise::Test::ControllerHelpers
  describe "request list of all projects" do
    it "responds with list of all projects" do
      project = build(:random_project)
      get projects_path
      binding.pry
      #TODO FIX FACTORY to login admin user
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryBot.create(:admin)
      expect(response).to be_successful
      expect(response.body).to include(“Test user”)
    end
  end
end
