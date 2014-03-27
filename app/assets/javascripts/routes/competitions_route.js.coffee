WorkoutWars.CompetitionsRoute = Ember.Route.extend
  model: ->
    @store.find('competition')

    @store.filter 'competition', (competition, index) ->
      (competition.get('status') != 'finished')
