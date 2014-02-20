WorkoutWars.Activity = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.Activity.reopen 
  user: DS.belongsTo('user', { async: true }) 
  exercise: DS.belongsTo('exercise', { embedded: "always" }) 
  value: DS.attr('number')
  createdAt: DS.attr('date')

  validations:
    value:
      numericality:
        onlyInteger: true
        greaterThan: 0


