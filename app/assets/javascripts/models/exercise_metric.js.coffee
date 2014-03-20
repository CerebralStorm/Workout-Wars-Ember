WorkoutWars.ExerciseMetric = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.ExerciseMetric.reopen 
  exercise: DS.belongsTo('exercise', { embedded: "always" }) 
  metric: DS.belongsTo('metric', { embedded: "always" }) 
  experienceMultiplier: DS.attr('number')

  validations:
    experienceMultiplier:
      numericality:
        greaterThan: 0