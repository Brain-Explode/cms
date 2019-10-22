class Project < ApplicationRecord
	has_and_belongs_to_many :users
	has_many   :tasks, dependent: :destroy
	validates  :project_title, presence: true
	has_one_attached :file
	resourcify
end
