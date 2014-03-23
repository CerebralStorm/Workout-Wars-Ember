WorkoutWars.ActivitiesCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord('activity')