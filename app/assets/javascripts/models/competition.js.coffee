WorkoutWars.Competition = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.Competition.reopen 
  competitionExercises: DS.hasMany('competitionExercise', { embedded: "always" }) 
  competitionActivities: DS.hasMany('competitionActivity', { async: true }) 
  competitionJoins: DS.hasMany('competitionJoin', { embedded: "always" }) 
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
  activeness: DS.attr('number')

  numOfParticipants: (->
    @get('maxParticipants') || "No Limit"
  ).property('maxParticipants')

  numberOfUsers: (->
    @get('competitionJoins.length')
  ).property('competitionJoins.@each')

  isFull: (->
    @get('numberOfUsers') == @get('numOfParticipants')
  ).property('maxParticipants')

  status: (->
    if @get('finished')
      'finished'
    else if @get('started')
      'started'
    else
      'unstarted'
  ).property()

  fireImg: (->
    activeness = parseInt(@get('activeness'))
    size = 30
    size = 30 + activeness * 10 if activeness > 1
    size = 180 if activeness >= 15
    "<img src=\"assets/fire.png\" style=\"width:#{size}px;height:#{size}px\" class=\"img-circle\">"
  ).property('activeness')


  validations:
    name:
      presence: true
      length:
        minimum: 5

    startDate:
      presence: true

    description:
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