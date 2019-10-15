require "rails_helper"

RSpec.describe "Projects", type: :request do
  describe "request list of all projects" do
    it "responds with list of all projects" do
      project = build(:random_project)
      # task = Task.new(title: 'qwe', body: "body", project_id: project.id)
      get projects_path
      binding.pry
      expect(response).to be_successful
      expect(response.body).to include(“Test user”)
    end
  end
end
