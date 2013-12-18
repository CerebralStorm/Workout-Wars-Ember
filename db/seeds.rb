puts "Seeding..."

Exercise.destroy_all
[
  {name: 'Pushups',    reps: true, distance: false,  duration: false, weight: false, calories: false},
  {name: 'Pullups',    reps: true, distance: false,  duration: false, weight: false, calories: false},
  {name: 'Situps',     reps: true, distance: false,  duration: false, weight: false, calories: false},
  {name: 'Squats',     reps: true, distance: false,  duration: false, weight: false, calories: false},
  {name: 'Lunges',     reps: true, distance: false,  duration: false, weight: false, calories: false},
  {name: 'Burpees',    reps: true, distance: false,  duration: false, weight: false, calories: false},
  {name: 'Running',    reps: false, distance: true,  duration: false, weight: false, calories: false},
  {name: 'Biking',     reps: false, distance: true,  duration: false, weight: false, calories: false},
  {name: 'Swimming',   reps: false, distance: true,  duration: false, weight: false, calories: false},
  {name: 'Hiking',     reps: false, distance: true,  duration: false, weight: false, calories: false}, 
  {name: 'Aerobics',   reps: false, distance: false, duration: true , weight: false, calories: false}, 
  {name: 'Yoga',       reps: false, distance: false, duration: true , weight: false, calories: false} 
].each do |exercise|
  Exercise.create!(exercise)
end

# Test Data
pushups = Exercise.find_by_name("Pushups")
competition = Competition.create(name: "Pushups Galore", start_date: Date.today, end_date: Date.today+3.weeks, lower_level_restriction: 0, upper_level_restriction: 20)
competition.competition_exercises.create(exercise: pushups)

puts "Complete!"