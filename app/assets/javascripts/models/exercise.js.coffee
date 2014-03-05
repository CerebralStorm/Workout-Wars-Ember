WorkoutWars.Exercise = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.Exercise.reopen
  metric:  DS.belongsTo('metric', { async: true })
  name: DS.attr('string')
  description: DS.attr('string')
  experienceMultiplier:  DS.attr('number')
  canDelete: DS.attr('boolean')
  custom: DS.attr('boolean')

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
