WorkoutWars.Exercise = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.Exercise.reopen
  exerciseMetrics: DS.hasMany('exerciseMetric', { async: true })
  name: DS.attr('string')
  description: DS.attr('string')
  experienceMultiplier:  DS.attr('number')
  canDelete: DS.attr('boolean')
  approved: DS.attr('boolean')

  validations:
    name:
      presence: true
      length:
        minimum: 5

    description:
      presence: true

    metric:
      presence: true

    experienceMultiplier:
      numericality:
        greaterThan: 0
