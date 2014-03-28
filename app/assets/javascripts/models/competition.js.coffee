WorkoutWars.Competition = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.Competition.reopen 
  competitionExercises: DS.hasMany('competitionExercise', { embedded: "always" }) 
  competitionUserExercises: DS.hasMany('competitionUserExercise', { async: true }) 
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

  exerciseIds: (->
    compExercises = @get('competitionExercises')
    ids = Ember.A()
    compExercises.forEach (compExercise) =>
      ids.pushObject(compExercise.get('exerciseId'))
    return ids
  ).property('competitionExercises.@each')

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
    return 'finished' if @get('finished')
    return 'started' if @get('started')
    'unstarted'
  ).property('started', 'finished')

  fireImg: (->
    activeness = parseInt(@get('activeness'))
    size = (activeness * 2) + 20
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