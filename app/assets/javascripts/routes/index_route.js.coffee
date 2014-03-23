WorkoutWars.IndexRoute = Ember.Route.extend
  model: ->
    @store.find('competition')
    @store.filter 'competition', (competition, index) ->
      (competition.get('status') != 'finished') && (competition.get('activeness') != 0)

  actions:
    setSuccess: (message) ->
      WorkoutWars.get("flash").success message

    setWarning: (message) ->
      WorkoutWars.get("flash").warning message

    clearFlash: ->
      WorkoutWars.get("flash").clear()


