class Task < ApplicationRecord
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

	belongs_to :user
	belongs_to :project
	has_many   :comments, dependent: :destroy
	validates  :title, :body, presence: true
	resourcify
end
