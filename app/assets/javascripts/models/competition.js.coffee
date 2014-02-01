WorkoutWars.Competition = DS.Model.extend
  competitionExercises: DS.hasMany('competitionExercise', { async: true }) 
  competitionActivities: DS.hasMany('competitionActivity', { async: true }) 
  competitionJoins: DS.hasMany('competitionJoin', { async: true }) 
  users: DS.hasMany('user', { async: true }) 
  competitionWinCondition: DS.belongsTo('competitionWinCondition', { async: true })
  user: DS.belongsTo('user', { async: true }) 
  name: DS.attr('string')
  startDate: DS.attr('date')
  endDate: DS.attr('date')
  description: DS.attr('string')
  maxParticipants: DS.attr('number')
  lowerLevelRestriction: DS.attr('number')
  upperLevelRestriction: DS.attr('string')
  started: DS.attr('boolean')
  finished: DS.attr('boolean')
  isPrivate: DS.attr('boolean')
  canUpdate: DS.attr('boolean')
  canDelete: DS.attr('boolean')

  numOfParticipants: (->
    @get('maxParticipants') || "No Limit"
  ).property('maxParticipants')

  numberOfUsers: (->
    @get('competitionJoins').get('length')
  ).property('competitionJoins.@each')

  status: (->
    if @get('finished')
      'finished'
    else if @get('started')
      'started'
    else
      'unstarted'
  ).property()

