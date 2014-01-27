FactoryGirl.define do
  factory :activity do
    exercise
    user
    reps 100
    distance 5
    duration 60
    weight 100
    calories 300
  end
end