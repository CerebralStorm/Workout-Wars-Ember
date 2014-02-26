WorkoutWars.ChallengeAttempt = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.ChallengeAttempt.reopen 
  challenge: DS.belongsTo('challenge', { async: true }) 
  user: DS.belongsTo('user', { async: true }) 
  activity: DS.belongsTo('activity', { embedded: "always" }) 
  result: DS.attr('string')
  createdAt:  DS.attr('date')
  canDelete: DS.attr('boolean')

  validations:
    result:
      numericality:
        greaterThan: 0