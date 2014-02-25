# for more details see: http://emberjs.com/guides/models/defining-models/

WorkoutWars.UserExercise = DS.Model.extend
  userId: DS.attr 'number'
  exerciseId: DS.attr 'string'
  integer: DS.attr 'string'
