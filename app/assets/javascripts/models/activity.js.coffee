WorkoutWars.Activity = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.Activity.reopen 
  user: DS.belongsTo('user') 
  exercise: DS.belongsTo('exercise', { embedded: 'load' }) 
  value: DS.attr('number')

  validations:
    value:
      numericality:
        onlyInteger: true
        greaterThan: 0


