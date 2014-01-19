FactoryGirl.define do
  factory :competition do
    sequence(:name) {|n| "Competition #{n}" }    
    start_date Date.today
    end_date Date.today + 14.days

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