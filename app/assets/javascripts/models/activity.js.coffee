WorkoutWars.Activity = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.Activity.reopen 
  user: DS.belongsTo('user', { embedded: "always" }) 
  exercise: DS.belongsTo('exercise', { embedded: "always" }) 
  value: DS.attr('number')

  validations:
    value:
      numericality:
        onlyInteger: true
        greaterThan: 0


