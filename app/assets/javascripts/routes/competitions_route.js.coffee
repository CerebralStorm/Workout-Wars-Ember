WorkoutWars.CompetitionsRoute = Ember.Route.extend
  model: ->
    @store.find('competition')
