WorkoutWars.Activity = DS.Model.extend 
  user: DS.belongsTo('user') 
  exercise: DS.belongsTo('exercise', { async: true }) 
  reps: DS.attr('number')
  distance: DS.attr('number')
  duration: DS.attr('number')
  calories: DS.attr('number')
  weight: DS.attr('number')
  createdAt: DS.attr('date')

