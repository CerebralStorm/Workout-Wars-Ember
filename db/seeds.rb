puts "Seeding..."

[
  {name: 'Reps',      measurement: "Repetitions" },
  {name: 'Distance',  measurement: "Miles" },
  {name: 'Duration',  measurement: "Hours" },
  {name: 'Weight',    measurement: "Pounds" },
  {name: 'Calories',  measurement: "Total Burned" },
].each do |metric|
  Metric.where(metric).first_or_create
end

[
  {name: 'Pushups',    metric: Metric.find_by_name("Reps"),       experience_multiplier: 1,     },
  {name: 'Pullups',    metric: Metric.find_by_name("Reps"),       experience_multiplier: 4,     },
  {name: 'Situps',     metric: Metric.find_by_name("Reps"),       experience_multiplier: 1,     },
  {name: 'Squats',     metric: Metric.find_by_name("Reps"),       experience_multiplier: 1,     },
  {name: 'Lunges',     metric: Metric.find_by_name("Reps"),       experience_multiplier: 1,     },
  {name: 'Burpees',    metric: Metric.find_by_name("Reps"),       experience_multiplier: 2,     },
  {name: 'Running',    metric: Metric.find_by_name("Distance"),   experience_multiplier: 40,    },
  {name: 'Biking',     metric: Metric.find_by_name("Distance"),   experience_multiplier: 15,    },
  {name: 'Swimming',   metric: Metric.find_by_name("Distance"),   experience_multiplier: 200,   },
  {name: 'Hiking',     metric: Metric.find_by_name("Distance"),   experience_multiplier: 15,    }, 
  {name: 'Aerobics',   metric: Metric.find_by_name("Duration"),   experience_multiplier: 2,     }, 
  {name: 'Yoga',       metric: Metric.find_by_name("Duration"),   experience_multiplier: 2,     } 
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







