WorkoutWars.CompetitionsCreateRoute = Ember.Route.extend
  model: ->
    @store.createRecord('competition')

  renderTemplate: ->
    @render "competition.edit",
      controller: "competitionsCreate"