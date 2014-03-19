Before do

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
  {name: 'Pushups',    metric: Metric.find_by_name("Reps"),       experience_multiplier: 1,     approved: true},
  {name: 'Pullups',    metric: Metric.find_by_name("Reps"),       experience_multiplier: 4,     approved: true},
  {name: 'Situps',     metric: Metric.find_by_name("Reps"),       experience_multiplier: 1,     approved: true},
  {name: 'Squats',     metric: Metric.find_by_name("Reps"),       experience_multiplier: 1,     approved: true},
  {name: 'Lunges',     metric: Metric.find_by_name("Reps"),       experience_multiplier: 1,     approved: true},
  {name: 'Burpees',    metric: Metric.find_by_name("Reps"),       experience_multiplier: 2,     approved: true},
  {name: 'Running',    metric: Metric.find_by_name("Distance"),   experience_multiplier: 40,    approved: true},
  {name: 'Biking',     metric: Metric.find_by_name("Distance"),   experience_multiplier: 15,    approved: true},
  {name: 'Swimming',   metric: Metric.find_by_name("Distance"),   experience_multiplier: 200,   approved: true},
  {name: 'Hiking',     metric: Metric.find_by_name("Distance"),   experience_multiplier: 15,    approved: true}, 
  {name: 'Aerobics',   metric: Metric.find_by_name("Duration"),   experience_multiplier: 2,     approved: true}, 
  {name: 'Yoga',       metric: Metric.find_by_name("Duration"),   experience_multiplier: 2,     approved: true} 
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
  {name: 'Most completed by date',  description: 'Winner will be determined by who has completed the most of this competitions exercise by the end date', multi_exercise: false},
  {name: 'Highest score by date',  description: 'Winner will be determined by who has the highest total score from all exercises by the end date', multi_exercise: true}
].each do |win_condition|
  CompetitionWinCondition.where(win_condition).first_or_create
end

end