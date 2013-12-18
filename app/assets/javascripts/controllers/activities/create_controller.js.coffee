WorkoutWars.ActivitiesCreateController = Ember.ObjectController.extend
  needs: ['application']

  useReps: (->
    value = @get('content.exercise').get('reps') if @get('content.exercise')
  ).property('content.exercise') 
  
  useDistance: (->
    value = @get('content.exercise').get('distance') if @get('content.exercise')
  ).property('content.exercise') 

  useDuration: (->
    value = @get('content.exercise').get('duration') if @get('content.exercise')
  ).property('content.exercise') 

  useCalories: (->
    value = @get('content.exercise').get('calories') if @get('content.exercise')
  ).property('content.exercise') 

  useWeight: (->
    value = @get('content.exercise').get('weight') if @get('content.exercise')
  ).property('content.exercise') 

  canSave: (->
    @get('content.exercise')
  ).property('content.exercise') 

  actions:
    addExercise: (exercise) ->
      @set('content.exercise', exercise)

    saveActivity: -> 
      activity = {
        user: @get('controllers.application.currentUser')
        exercise: @get('content.exercise')
        reps: @get('reps')
        distance: @get('distance')
        duration: @get('duration')
        calories: @get('calories')
        weight: @get('weight')
      }

      activity = @store.createRecord('activity', activity)
      activity.save().then =>
        @transitionToRoute('activities', @get('controllers.application.currentUser'))