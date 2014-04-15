WorkoutWars.UserNotificationController = Ember.ObjectController.extend
  updateActive: (->
    @get('model').save()
  ).observes('model.active')
