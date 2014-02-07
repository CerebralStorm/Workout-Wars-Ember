WorkoutWars.ContactController = Ember.Controller.extend
  actions:
    create: (feedback) ->    
      success = (feedback) =>
        WorkoutWars.get("flash").success "Thank you for your feedback!"
        @transitionToRoute('/')
      failure = (response) =>
        WorkoutWars.get("flash").danger "An error has occured"
      feedback.save().then success, failure