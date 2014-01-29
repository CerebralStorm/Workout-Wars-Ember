Before do
  [
    {name: 'Pushups',    reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Pullups',    reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Situps',     reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Squats',     reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Lunges',     reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Burpees',    reps: true, distance: false,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Running',    reps: false, distance: true,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Biking',     reps: false, distance: true,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Swimming',   reps: false, distance: true,  duration: false, weight: false, calories: false, experience_multiplier: 1},
    {name: 'Hiking',     reps: false, distance: true,  duration: false, weight: false, calories: false, experience_multiplier: 1}, 
    {name: 'Aerobics',   reps: false, distance: false, duration: true , weight: false, calories: false, experience_multiplier: 1}, 
    {name: 'Yoga',       reps: false, distance: false, duration: true , weight: false, calories: false, experience_multiplier: 1} 
  ].each do |exercise|
    Exercise.where(exercise).first_or_create
  end

    [
      {name: 'Most completed by date',  description: 'Winner will be determined by who has completed the most of this competitions exercise by the end date'}
    ].each do |win_condition|
      CompetitionWinCondition.where(win_condition).first_or_create
    end
end