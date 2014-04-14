# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_notification do
    user
    notification
    time_period 3600
  end
end
