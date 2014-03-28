WorkoutWars.IndexRoute = Ember.Route.extend
  model: ->
    @store.find('feed')

  reload: (->
    console.log "called"
    @store.find('feed')
  ).observes('userExercise.@each')

  actions:
    setSuccess: (message) ->
      WorkoutWars.get("flash").success message

    setWarning: (message) ->
      WorkoutWars.get("flash").warning message

    clearFlash: ->
      WorkoutWars.get("flash").clear()


