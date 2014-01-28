WorkoutWars.Competition = DS.Model.extend
  competitionExercises: DS.hasMany('competitionExercise', { embedded: 'load' }) 
  competitionActivities: DS.hasMany('competitionActivity', { embedded: 'load' }) 
  competitionJoins: DS.hasMany('competitionJoin', { embedded: 'load' }) 
  users: DS.hasMany('user', { embedded: 'load' }) 
  creator: DS.belongsTo('creator', { embedded: 'load' }) 
  name: DS.attr('string')
  startDate: DS.attr('date')
  endDate: DS.attr('date')
  description: DS.attr('string')
  maxParticipants: DS.attr('number')
  lowerLevelRestriction: DS.attr('number')
  upperLevelRestriction: DS.attr('string')
  started: DS.attr('boolean')
  isPrivate: DS.attr('boolean')

  numOfParticipants: (->
    @get('maxParticipants') || "No Limit"
  ).property('maxParticipants')

  numberOfUsers: (->
    @get('competitionJoins').get('length')
  ).property('competitionJoins.@each')

