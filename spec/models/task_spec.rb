require "rails_helper"

RSpec.describe Task, type: :model do
  it "has reflections to user, project, comments and roles" do
    expect(subject.class.reflections.keys).to eq(["user", "project", "comments", "roles"])
  end
end
