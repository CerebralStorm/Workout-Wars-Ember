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
  {name: 'Minute Pushups',          description: 'How many pushups can you do in one minute?',    metric: Metric.find_by_name("Reps")},
  {name: 'Max Pushups',             description: 'How many pushups can you do in one set?',       metric: Metric.find_by_name("Reps")},
  {name: 'Minute Pull-ups',         description: 'How many pull-ups can you do in one minute?',   metric: Metric.find_by_name("Reps")},
  {name: 'Max Pull-ups',            description: 'How many pull-ups can you do in one set?',      metric: Metric.find_by_name("Reps")},
  {name: 'Minute Sit-ups',          description: 'How many sit-ups can you do in one minute?',    metric: Metric.find_by_name("Reps")},
  {name: 'Max Sit-ups',             description: 'How many sit-ups can you do in one set?',       metric: Metric.find_by_name("Reps")},
  {name: 'Fast Mile Swim',          description: 'How fast can you swim a mile?',                 metric: Metric.find_by_name("Duration")},
  {name: 'Max Mile Swim',           description: 'How many miles can you swim in one day?',       metric: Metric.find_by_name("Distance")},
  {name: 'Fastest 5K',              description: 'How fast can you run a 5K?',                    metric: Metric.find_by_name("Duration")},
  {name: 'Fastest 10K',             description: 'How fast can you run a 10K?',                   metric: Metric.find_by_name("Duration")}, 
  {name: 'Cycle Miles in day',      description: 'How many miles can you bike in one day?',       metric: Metric.find_by_name("Distance")}, 
  {name: 'Hiking Distance',  description: 'How far can you hike in a day?',                       metric: Metric.find_by_name("Distance")},
].each do |challenge|
  Challenge.where(challenge).first_or_create
end

[
  {name: 'Most completed by date',  description: 'Winner will be determined by who has completed the most of this competitions exercise by the end date'}
].each do |win_condition|
  CompetitionWinCondition.where(win_condition).first_or_create
end







