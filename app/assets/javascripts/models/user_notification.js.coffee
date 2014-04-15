WorkoutWars.UserNotification = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.UserNotification.reopen 
  user: DS.belongsTo('user', { async: true }) 
  notification: DS.belongsTo('notification', { async: true }) 
  name: DS.attr('string')
  useTimePeriod: DS.attr('boolean')
  timePeriod: DS.attr('number')
  active: DS.attr('boolean')

  validations:
    timePeriod:
      numericality:
        greaterThan: 0