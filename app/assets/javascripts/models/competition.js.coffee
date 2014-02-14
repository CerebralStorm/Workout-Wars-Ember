WorkoutWars.Competition = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.Competition.reopen 
  competitionExercises: DS.hasMany('competitionExercise', { embedded: 'load' }) 
  competitionActivities: DS.hasMany('competitionActivity', { embedded: 'load' }) 
  competitionJoins: DS.hasMany('competitionJoin', { embedded: 'load' }) 
  users: DS.hasMany('user', { embedded: 'load' }) 
  competitionWinCondition: DS.belongsTo('competitionWinCondition', { embedded: 'load' })
  user: DS.belongsTo('user', { embedded: 'load' }) 
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


  validations:
    name:
      presence: true
      length:
        minimum: 5

    startDate:
      presence: true

    endDate:
      presence: true

    competitionWinCondition:
      presence: true

    maxParticipants:
      numericality:
        onlyInteger: true
        allowBlank: true
        greaterThan: 0
        lessThanOrEqualTo: 1000 