class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :trails, dependent: :destroy
  has_many :lesson_progresses
  has_many :completed_lessons, through: :lesson_progresses, source: :lesson
  has_one_attached :avatar
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def progress_for(trail)
    total = trail.lessons.count
    completed = lesson_progresses.where(lesson_id: trail.lesson_ids, completed: true).count
    return 0 if total.zero?
    ((completed.to_f / total) * 100).round
  end
end
