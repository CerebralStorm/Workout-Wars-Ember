WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  needs: ['exercises']
  selectedExercise: null
  isAddingExercise: false

  actions:
    create: (competition) ->
      @set('isAddingExercise', true)
      competition.set('isPrivate', @get('isPrivate')) if @get('isPrivate')
      competition.set('startDate', moment(@get('startDate')).toDate()) if @get('startDate')
      competition.set('endDate', moment(@get('endDate')).toDate()) if @get('endDate')

      success = (competition) =>
        @set('startDate', "")
        @set('endDate', "")
        @set('isPrivate', false)
        @transitionToRoute('competition', competition)
      failure = (response) =>
        @set('errors', @get('content.errors'))
      competition.save().then success, failure
      @set('isAddingExercise', false)
