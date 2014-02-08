# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    name "User"
    email "user@feedback.com"
    subject "This is a subject"
    content "Your site is awesome!"
  end
end
