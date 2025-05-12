class Session < ApplicationRecord
  belongs_to :user
  has_many :lesson_progresses
  has_many :users_completed, through: :lesson_progresses, source: :user
end
