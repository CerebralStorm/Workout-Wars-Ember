WorkoutWars.ActivitiesCreateController = Ember.ObjectController.extend
  needs: ['application']

  exercise: null

  actions:
    addExercise: (exercise) ->
      @set('exercise', exercise)
      console.log @get('exercise')

    saveActivity: -> 
      console.log @get('exercise')
      activity = {
        user: @get('controllers.application.currentUser')
        exercise: @get('exercise')
        reps: @get('reps')
        distance: @get('distance')
        duration: @get('duration')
        calories: @get('calories')
        weight: @get('weight')
      }

      activity = @store.createRecord('activity', activity)
      activity.save().then ->
        @transitionTo activity