WorkoutWars.UserCompetitionRoute = Ember.Route.extend
  model: (controller, model) ->
    @store.find("competition", model.params.competition_id)