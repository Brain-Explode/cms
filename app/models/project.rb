class Project < ApplicationRecord
	belongs_to :user
	has_many   :tasks, dependent: :destroy
	validates  :project_title, presence: true
end
