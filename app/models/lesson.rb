class Lesson < ApplicationRecord
  belongs_to :trail
  validates :title, :content, :trail_id, presence: true
end
