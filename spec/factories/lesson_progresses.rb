FactoryBot.define do
  factory :lesson_progress do
    user { nil }
    lesson { nil }
    completed { false }
  end
end
