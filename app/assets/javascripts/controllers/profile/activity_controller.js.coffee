WorkoutWars.ActivityController = Ember.ObjectController.extend
  needs: ['profile']
  profile: Ember.computed.alias('controllers.profile.content')
  
  actions:
    delete: (activity) ->
      if window.confirm "Are you sure?"
        @get("model").destroyRecord().then =>
          @get('profile').reload()
          @transitionToRoute("profile.activities")  