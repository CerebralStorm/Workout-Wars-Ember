WorkoutWars.UserEditController = Ember.ObjectController.extend
  
  actions:
    saveUser: ->
      user = @get("model")
      user.save()
      @transitionToRoute "user", user