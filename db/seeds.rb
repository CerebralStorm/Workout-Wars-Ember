puts "Seeding..."

[
  {name: 'Reps',      measurement: "Repetitions" },
  {name: 'Distance',  measurement: "Miles" },
  {name: 'Duration',  measurement: "Minutes" },
  {name: 'Weight',    measurement: "Pounds" },
  {name: 'Calories',  measurement: "Total Burned" },
].each do |metric|
  Metric.where(metric).first_or_create
end

[
  {name: 'Pushups',           metric: Metric.find_by_name("Reps"),       experience_multiplier: 1,     },
  {name: 'Pullups',           metric: Metric.find_by_name("Reps"),       experience_multiplier: 4,     },
  {name: 'Situps',            metric: Metric.find_by_name("Reps"),       experience_multiplier: 1,     },
  {name: 'Squats',            metric: Metric.find_by_name("Reps"),       experience_multiplier: 1,     },
  {name: 'Lunges',            metric: Metric.find_by_name("Reps"),       experience_multiplier: 1,     },
  {name: 'Burpees',           metric: Metric.find_by_name("Reps"),       experience_multiplier: 2,     },
  {name: 'Running',           metric: Metric.find_by_name("Distance"),   experience_multiplier: 40,    },
  {name: 'Biking',            metric: Metric.find_by_name("Distance"),   experience_multiplier: 15,    },
  {name: 'Swimming',          metric: Metric.find_by_name("Distance"),   experience_multiplier: 200,   },
  {name: 'Hiking',            metric: Metric.find_by_name("Distance"),   experience_multiplier: 15,    },
  {name: 'Walking',           metric: Metric.find_by_name("Distance"),   experience_multiplier: 10,    }, 
  {name: 'Aerobics',          metric: Metric.find_by_name("Duration"),   experience_multiplier: 2,     }, 
  {name: 'Zumba',             metric: Metric.find_by_name("Duration"),   experience_multiplier: 2,     }, 
  {name: 'Yoga',              metric: Metric.find_by_name("Duration"),   experience_multiplier: 2,     } 
].each do |exercise|
  Exercise.where(exercise).first_or_create
end

[
  {name: 'Minute Pushups',          description: 'How many pushups can you do in one minute?',    exercise: Exercise.find_by_name("Pushups")},
  {name: 'Max Pushups',             description: 'How many pushups can you do in one set?',       exercise: Exercise.find_by_name("Pushups")},
  {name: 'Minute Pull-ups',         description: 'How many pull-ups can you do in one minute?',   exercise: Exercise.find_by_name("Pullups")},
  {name: 'Max Pull-ups',            description: 'How many pull-ups can you do in one set?',      exercise: Exercise.find_by_name("Pullups")},
  {name: 'Minute Sit-ups',          description: 'How many sit-ups can you do in one minute?',    exercise: Exercise.find_by_name("Situps")},
  {name: 'Max Sit-ups',             description: 'How many sit-ups can you do in one set?',       exercise: Exercise.find_by_name("Situps")},
  {name: 'Minute Squats',           description: 'How many squats can you do in one minute?',     exercise: Exercise.find_by_name("Squats")},
  {name: 'Max Squats',              description: 'How many squats can you do in one set?',        exercise: Exercise.find_by_name("Squats")},
  {name: 'Minute Lunges',           description: 'How many lunges can you do in one minute?',     exercise: Exercise.find_by_name("Lunges")},
  {name: 'Max Lunges',              description: 'How many lunges can you do in one set?',        exercise: Exercise.find_by_name("Lunges")},
  {name: 'Minute Burpees',          description: 'How many burpees can you do in one minute?',    exercise: Exercise.find_by_name("Burpees")},
  {name: 'Max Burpees',             description: 'How many burpees can you do in one set?',       exercise: Exercise.find_by_name("Burpees")},
  {name: 'Hour Running',            description: 'How many miles can you run in one hour?',       exercise: Exercise.find_by_name("Running")},
  {name: 'Hour Swimming',           description: 'How many miles can you swim in one hour?',      exercise: Exercise.find_by_name("Swimming")},
  {name: 'Hour Biking',             description: 'How many miles can you bike in one hour?',      exercise: Exercise.find_by_name("Biking")},
].each do |challenge|
  Challenge.where(challenge).first_or_create
end

[
  {name: 'Most completed by date',  description: 'Winner will be determined by who has completed the most of this competitions exercise by the end date'}
].each do |win_condition|
  CompetitionWinCondition.where(win_condition).first_or_create
end







