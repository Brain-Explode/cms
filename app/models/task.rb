class Task < ApplicationRecord
	belongs_to :user
	belongs_to :project
	has_many   :comments, dependent: :destroy
	resourcify
end
