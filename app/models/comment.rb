class Comment < ApplicationRecord
	belongs_to :task
	belongs_to :user
	has_many_attached :files
	has_many_attached :images
	resourcify

  attr_accessor :remove_images, :boolean

  after_save :purge_images

  def purge_images
    return unless @remove_images == '1'
      images.purge_later
  end
end
