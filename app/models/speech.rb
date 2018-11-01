class Speech < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :speech_themes
  has_many :themes, through: :speech_themes

  validates :title, :content, :speaking_day, :location_id, :user_id,
    presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  scope :created_at_desc, ->{order created_at: :desc}
end
