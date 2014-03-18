WorkoutWars.ActivityController = Ember.ObjectController.extend
  actions:
    delete: (activity) ->
      if window.confirm "Are you sure?"
        @get("model").destroyRecord().then =>
          @transitionToRoute("profile.activities")  