require "rails_helper"

RSpec.describe "Projects", type: :request do
  include Devise::Test::ControllerHelpers
  describe "request list of all projects" do
    it "responds with list of all projects" do
      binding.pry
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin_user = FactoryBot.create(:admin_user)
      sign_in :admin_user, admin_user # sign_in(scope, resource
      project = build(:random_project)
      # task = Task.new(title: 'qwe', body: "body", project_id: project.id)
      get projects_path
      expect(response).to be_successful
      expect(response.body).to include(“Test user”)
    end
  end
end
