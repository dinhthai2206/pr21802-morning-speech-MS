class User < ApplicationRecord
  has_many :speeches, dependent: :destroy
  has_many :services, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable, :omniauthable
end
