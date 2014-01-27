WorkoutWars.ActivitiesCreateRoute = Ember.Route.extend
  renderTemplate: ->
    @render "activity.edit",
      controller: "activitiesCreate"