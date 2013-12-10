WorkoutWars.UserCompetitionsRoute = Ember.Route.extend
  model: (controller, model) ->
    @store.find('competition', model.user_id)