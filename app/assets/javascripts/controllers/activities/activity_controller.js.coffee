WorkoutWars.ActivitiesActivityController = Ember.ObjectController.extend
  needs: ['activities']
  
  actions:
    delete: (activity) ->
      if window.confirm "Are you sure?"
        @get("model").destroyRecord().then =>
          @get('controllers.activities').reload()
          @transitionToRoute("activities")  