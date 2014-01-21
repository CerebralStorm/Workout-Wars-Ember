WorkoutWars.Competition = DS.Model.extend
  competitionExercises: DS.hasMany('competitionExercise', { async: true }) 
  competitionActivities: DS.hasMany('competitionActivity', { async: true }) 
  competitionJoins: DS.hasMany('competitionJoin', { async: true }) 
  users: DS.hasMany('user', { async: true }) 
  name: DS.attr('string', { required: true })
  startDate: DS.attr('date', { required: true })
  endDate: DS.attr('date', { required: true })
  maxParticipants: DS.attr('number')
  lowerLevelRestriction: DS.attr('number')
  upperLevelRestriction: DS.attr('string')
  started: DS.attr('boolean')
  isPublic: DS.attr('boolean')

