WorkoutWars.Challenge = DS.Model.extend
  exercises: DS.hasMany('exercise', { embedded: true }) 
  name: DS.attr('string')
  description: DS.attr('string')
  startDate: DS.attr('date')
  endDate: DS.attr('date')
  maxParticipants: DS.attr('number')
  lowerLevelRestriction: DS.attr('number')
  upperLevelRestriction: DS.attr('string')
