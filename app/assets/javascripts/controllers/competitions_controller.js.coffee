WorkoutWars.CompetitionsController = Ember.ArrayController.extend
  sortProperties: ['name']

  actions:

    delete: (competition) ->
      if window.confirm "Are you sure?"
        competition.deleteRecord()
        competition.save()
        @transitionToRoute "competitions"
        