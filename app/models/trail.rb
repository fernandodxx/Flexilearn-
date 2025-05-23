class Trail < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :destroy
  has_many :favorites
  has_one_attached :cover_image
end
