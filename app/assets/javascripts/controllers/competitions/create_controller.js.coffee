WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  needs: ['exercises', 'application']
  selectedExercise: null

  actions:
    create: (competition) ->
      competition.set('isPrivate', @get('isPrivate')) if @get('isPrivate')
      competition.set('startDate', moment(@get('startDate')).toDate()) if @get('startDate')
      competition.set('endDate', moment(@get('endDate')).toDate()) if @get('endDate')
      competition.set('creator', @get('controllers.application.currentUser'))

      success = (competition) =>
        @set('startDate', "")
        @set('endDate', "")
        @set('isPrivate', false)
        @transitionToRoute('competition', competition)
      failure = (response) =>
        @set('errors', @get('content.errors'))
      competition.save().then success, failure
