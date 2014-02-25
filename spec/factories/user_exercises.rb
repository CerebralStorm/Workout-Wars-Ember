# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_exercise do
    user_id 1
    exercise_id "MyString"
    integer "MyString"
  end
end
