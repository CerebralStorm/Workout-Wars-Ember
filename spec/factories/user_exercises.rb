# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_exercise do
    user
    exercise
  end
end
