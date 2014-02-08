# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :challenge_attempt do
    user
    challenge
    result 50
  end
end
