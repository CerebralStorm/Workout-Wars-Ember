WorkoutWars.UserExercise = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.UserExercise.reopen 
  user: DS.belongsTo('user', { async: true }) 
  competitionUserExercises: DS.hasMany('competitionUserExercise', { async: true }) 
  exercise: DS.belongsTo('exercise', { embedded: "always" }) 
  value: DS.attr('number')
  createdAt: DS.attr('date')

  validations:
    value:
      numericality:
        greaterThan: 0
        lessThan: 1000


