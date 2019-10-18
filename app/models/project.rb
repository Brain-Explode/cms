class Project < ApplicationRecord
	belongs_to :user
	has_many   :tasks, dependent: :destroy
	validates  :project_title, presence: true
	has_one_attached :file
	resourcify
end
