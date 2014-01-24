WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  needs: ['exercises']
  selectedExercise: null

  actions:
    create: (competition) ->
      competition.set('isPrivate', @get('isPrivate')) if @get('isPrivate')
      competition.set('startDate', moment(@get('startDate')).toDate()) if @get('startDate')
      competition.set('endDate', moment(@get('endDate')).toDate()) if @get('endDate')

      success = (competition) =>
        @set('startDate', "")
        @set('endDate', "")
        @transitionToRoute('competition', competition)
      failure = (response) =>
        @set('errors', @get('content.errors'))
      competition.save().then success, failure
