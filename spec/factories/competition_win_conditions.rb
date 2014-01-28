# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :competition_win_condition do
    name "Most completed by date"
    description "Winner will be determined by who has completed the most of this competitions exercise by the end date"
  end
end
