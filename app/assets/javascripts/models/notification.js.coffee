WorkoutWars.Notification = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.Notification.reopen
  name: DS.attr('string')