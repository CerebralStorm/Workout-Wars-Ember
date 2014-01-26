FactoryGirl.define do
  factory :competition do
    sequence(:name) {|n| "Competition #{n}" }    
    start_date 1.day.from_now
    end_date 2.weeks.from_now
    association :creator, factory: :user
    
    factory :private_competition do
      public false
    end

    # factory :team_competition do
    #   team true
    #   number_of_teams 2
    #   after(:create) {|instance| instance.create_teams }
    # end
  end
end