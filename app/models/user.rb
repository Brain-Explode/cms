# frozen_string_literal: true

class User < ApplicationRecord
  rolify

	has_many :projects
	has_many :tasks
	has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :assign_default_role

  def assign_default_role
    add_role(:client) if self.roles.blank?
  end
end
