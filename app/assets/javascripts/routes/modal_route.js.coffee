WorkoutWars.ModalRoute = Ember.Route.extend
  actions:   
    cancel: ->
      @transitionTo("#{window.history.go(-1)}")
        
    submit: ->
      @transitionTo('index')