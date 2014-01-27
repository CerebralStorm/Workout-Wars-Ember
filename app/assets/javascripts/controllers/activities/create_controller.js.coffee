WorkoutWars.ActivitiesCreateController = Ember.ObjectController.extend
  needs: ['application']

  exercise: null
  reps: null
  distance: null
  duration: null
  calories: null
  weight: null

  useReps: (->
    value = @get('exercise').get('reps') if @get('exercise')
  ).property('exercise') 
  
  useDistance: (->
    value = @get('exercise').get('distance') if @get('exercise')
  ).property('exercise') 

  useDuration: (->
    value = @get('exercise').get('duration') if @get('exercise')
  ).property('exercise') 

  useCalories: (->
    value = @get('exercise').get('calories') if @get('exercise')
  ).property('exercise') 

  useWeight: (->
    value = @get('exercise').get('weight') if @get('exercise')
  ).property('exercise') 

  canSave: (->
    @get('exercise')
  ).property('exercise') 

  actions:
    addExercise: (exercise) ->
      @set('exercise', exercise)

    saveActivity: -> 
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
      activity.save().then =>
        @set('reps', null)
        @set('distance', null)
        @set('duration', null)
        @set('calories', null)
        @set('weight', null)
        @transitionToRoute('activities', @get('controllers.application.currentUser'))