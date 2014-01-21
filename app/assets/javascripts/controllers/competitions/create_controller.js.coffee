WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  needs: ['exercises']
  selectedExercise: null

  selectExercises: ( ->
    @get('controllers.exercises')
  ).property()

  actions:
    create: (competition) ->
      isPublic = true
      isPublic = false if @get('isPrivate')
      competition.set('isPublic', isPublic)

      competition.set('startDate', moment(@get('startDate'), "YYYY-MM-DD").toDate()) if @get('startDate')
      competition.set('endDate', moment(@get('endDate'), "YYYY-MM-DD").toDate()) if @get('endDate')

      success = (competition) =>
        @transitionToRoute('competition', competition)
      failure = (response) =>
        @set('errors', @get('content.errors'))
      competition.save().then success, failure
