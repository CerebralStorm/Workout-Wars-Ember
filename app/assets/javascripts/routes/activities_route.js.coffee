WorkoutWars.ActivitiesRoute = Ember.Route.extend
  model: ->
    @store.createRecord('activity')

