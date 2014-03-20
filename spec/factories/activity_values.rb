# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity_value do
    metric_id 1
    activity_id 1
    value 1.5
  end
end
