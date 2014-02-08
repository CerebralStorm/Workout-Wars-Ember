WorkoutWars.ContactController = Ember.Controller.extend
  errors: Ember.computed.alias('model.errors')

  actions:
    create: (feedback) ->    
      success = (feedback) =>
        WorkoutWars.get("flash").success "Thank you for your feedback!"
        @transitionToRoute('/')
      failure = (response) =>
        WorkoutWars.get("flash").danger response
      feedback.save().then success, failure