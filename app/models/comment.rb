class Comment < ApplicationRecord
	belongs_to :task
	belongs_to :user
	has_many_attached :files
	has_many_attached :images
	resourcify

  attr_accessor :remove_images
	attr_accessor :remove_files

  after_save :purge_images, if: :remove_images
	after_save :purge_files, if: :remove_files

  def purge_images
    images.purge_later
  end

  def purge_files
    files.purge_later
  end
end
