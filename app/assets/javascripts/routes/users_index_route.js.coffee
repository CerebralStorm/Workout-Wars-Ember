WorkoutWars.UsersIndexRoute = Ember.Route.extend  
  model: ->
    @store.find('user')