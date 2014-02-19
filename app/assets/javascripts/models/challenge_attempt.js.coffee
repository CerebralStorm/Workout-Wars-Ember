WorkoutWars.ChallengeAttempt = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.ChallengeAttempt.reopen 
  challenge: DS.belongsTo('challenge', { embedded: 'load' }) 
  user: DS.belongsTo('user', { embedded: 'load' }) 
  result: DS.attr('string')
  createdAt:  DS.attr('date')
  canDelete: DS.attr('boolean')

  validations:
    result:
      numericality:
        greaterThan: 0