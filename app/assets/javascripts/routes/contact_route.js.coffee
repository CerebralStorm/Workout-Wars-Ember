WorkoutWars.ContactRoute = Ember.Route.extend
  model: ->
    @store.createRecord('feedback')