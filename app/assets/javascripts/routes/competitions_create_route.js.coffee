WorkoutWars.CompetitionsCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord('competition')
