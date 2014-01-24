FactoryGirl.define do
  factory :exercise do
    name "Pushups"
    experience_multiplier 1.0
    reps true
    weight false
    duration false
    calories false
    distance false
  end
end