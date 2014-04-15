WorkoutWars.UserNotification = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.UserNotification.reopen 
  user: DS.belongsTo('user', { async: true }) 
  user: DS.belongsTo('notification', { async: true }) 
  timePeriod: DS.attr('number')
  active: DS.attr('boolean')
