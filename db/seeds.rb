puts "Seeding..."

[
  {name: 'Pushups',    reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1, measurement: "Number of Reps"},
  {name: 'Pullups',    reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 4, measurement: "Number of Reps"},
  {name: 'Situps',     reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1, measurement: "Number of Reps"},
  {name: 'Squats',     reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1, measurement: "Number of Reps"},
  {name: 'Lunges',     reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1, measurement: "Number of Reps"},
  {name: 'Burpees',    reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 2, measurement: "Number of Reps"},
  {name: 'Running',    reps: false, distance: true,  duration: false, weight: false, calories: false, experience_multiplier: 40, measurement: "Number of Miles"},
  {name: 'Biking',     reps: false, distance: true,  duration: false, weight: false, calories: false, experience_multiplier: 15, measurement: "Number of Miles"},
  {name: 'Swimming',   reps: false, distance: true,  duration: false, weight: false, calories: false, experience_multiplier: 200, measurement: "Number of Miles"},
  {name: 'Hiking',     reps: false, distance: true,  duration: false, weight: false, calories: false, experience_multiplier: 15, measurement: "Number of Miles"}, 
  {name: 'Aerobics',   reps: false, distance: false, duration: true , weight: false, calories: false, experience_multiplier: 2, measurement: "Number of Minutes"}, 
  {name: 'Yoga',       reps: false, distance: false, duration: true , weight: false, calories: false, experience_multiplier: 2, measurement: "Number of Minutes"} 
].each do |exercise|
  Exercise.where(exercise).first_or_create
end

[
  {name: 'Minute Pushups',  description: 'How many pushups can you do in one minute?',  start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now},
  {name: 'Max Pushups',    description: 'How many pushups can you do in one set?',start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now},
  {name: 'Minute Pull-ups',     description: 'How many pull-ups can you do in one minute?',start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now},
  {name: 'Max Pull-ups',     description: 'How many pull-ups can you do in one set?',start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now},
  {name: 'Minute Sit-ups',    description: 'How many sit-ups can you do in one minute?', start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now},
  {name: 'Max Sit-ups',    description: 'How many sit-ups can you do in one set?',start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now},
  {name: 'Fast Mile Swim',    description: 'How fast can you swim a mile?',start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now},
  {name: 'Max Mile Swim',     description: 'How many miles can you swim in one day?',start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now},
  {name: 'Fastest 5K',   description: 'How fast can you run a 5K?',start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now},
  {name: 'Fastest 10K',    description: 'How fast can you run a 10K?', start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now}, 
  {name: 'Cycle Miles in day',   description: 'How many miles can you bike in one day?',start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now}, 
  {name: 'Daily Walking Distance',  description: 'How far can you walk in a day?',     start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now} ,
  {name: 'Max Days Walking',    description: 'How many days in a row can you walk a mile or more?',start_date: Time.now,  is_private: true, active: true, user_id: 1,  created_at: Time.now}
].each do |challenge|
  Challenge.where(challenge).first_or_create
end

[
  {name: 'Most completed by date',  description: 'Winner will be determined by who has completed the most of this competitions exercise by the end date'}
].each do |win_condition|
  CompetitionWinCondition.where(win_condition).first_or_create
end

# Test Data
user = User.create(name: "tester@testhole.com", password: "testhole")
pushups = Exercise.find_by_name("Pushups")
competition = Competition.where(name: "Pushups Galore", start_date: Date.today, end_date: 2.weeks.from_now, user: user).first_or_create
competition.competition_exercises.where(exercise: pushups).first_or_create







