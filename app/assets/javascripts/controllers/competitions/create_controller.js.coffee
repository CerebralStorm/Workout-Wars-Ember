WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  needs: ['exercises']
  selectedExercise: null

  actions:
    create: (competition) ->
      competition.set('becameValid', true)
      isPublic = true
      isPublic = false if @get('isPrivate')
      competition.set('isPublic', isPublic)
      competition.set('startDate', moment(@get('startDate'), "MM-DD-YYYY").toDate()) if @get('startDate')
      competition.set('endDate', moment(@get('endDate'), "MM-DD-YYYY").toDate()) if @get('endDate')

      success = (competition) =>
        @transitionToRoute('competition', competition)
      failure = (response) =>
        @set('errors', @get('content.errors'))
      competition.save().then success, failure
