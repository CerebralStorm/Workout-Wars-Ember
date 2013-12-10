WorkoutWars.Competition = DS.Model.extend
  eventExercises: DS.hasMany('eventExercise', { embedded: true }) 
  exercises: DS.hasMany('exercise', { embedded: true }) 
  users: DS.hasMany('user', { embedded: true }) 
  name: DS.attr('string')
  startDate: DS.attr('date')
  endDate: DS.attr('date')
  maxParticipants: DS.attr('number')
  lowerLevelRestriction: DS.attr('number')
  upperLevelRestriction: DS.attr('string')

