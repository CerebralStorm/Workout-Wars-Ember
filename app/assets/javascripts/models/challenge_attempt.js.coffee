WorkoutWars.ChallengeAttempt = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.ChallengeAttempt.reopen 
  challenge: DS.belongsTo('challenge', { embedded: "always" }) 
  user: DS.belongsTo('user', { embedded: "always" }) 
  result: DS.attr('string')
  createdAt:  DS.attr('date')
  canDelete: DS.attr('boolean')

  validations:
    result:
      numericality:
        greaterThan: 0