class Project < ApplicationRecord
	has_many :tasks, dependent: :destroy
	validates :project_title, presence: true
end
