class Comment < ApplicationRecord
	belongs_to :task
	belongs_to :user
	has_many_attached :files
	has_many_attached :images
	resourcify

  attr_accessor :remove_images

  after_save :purge_images, if: :remove_images

  def purge_images
    images.purge_later
  end
end
