WorkoutWars.ProfileEditController = Ember.ObjectController.extend  
  actions:
    saveUser: ->
      user = @get("model")
      user.save().then (user) =>
        @transitionToRoute "profile", user