class User < ApplicationRecord
  rolify

  accepts_nested_attributes_for :roles,
    allow_destroy: true,
    reject_if: ->(hash){ hash["_keep"] != "1" }
	has_many :projects
	has_many :tasks
	has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # attr_accessor :role_ids
end
