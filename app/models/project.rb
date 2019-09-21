class Project < ApplicationRecord
	validates :project_title, presence: true
end
