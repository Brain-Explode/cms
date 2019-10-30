class Comment < ApplicationRecord
	belongs_to :task
	belongs_to :user
	has_many_attached :files
	has_many_attached :images
	resourcify

  attr_accessor :remove_images, :boolean

  after_save :purge_images,

  def purge_images
    if @remove_images == '1'
      images.purge_later
    else
      return
    end
  end
end
