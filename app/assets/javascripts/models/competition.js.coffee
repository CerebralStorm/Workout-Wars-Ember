WorkoutWars.Competition = DS.Model.extend
  competitionExercises: DS.hasMany('competitionExercise', { async: true }) 
  competitionActivities: DS.hasMany('competitionActivity', { async: true }) 
  competitionJoins: DS.hasMany('competitionJoin', { async: true }) 
  exercises: DS.hasMany('exercise', { async: true }) 
  users: DS.hasMany('user', { async: true }) 
  name: DS.attr('string')
  startDate: DS.attr('date')
  endDate: DS.attr('date')
  maxParticipants: DS.attr('number')
  lowerLevelRestriction: DS.attr('number')
  upperLevelRestriction: DS.attr('string')
  started: DS.attr('boolean')

