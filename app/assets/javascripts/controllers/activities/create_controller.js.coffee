WorkoutWars.ActivitiesCreateController = Ember.ObjectController.extend
  needs: ['exercises']
  selectedExercise: null

  exercises: (->
    @get('controllers.exercises.content')
  ).property('controllers.exercises')

  useReps: (->
    @get('selectedExercise').get('reps') if @get('selectedExercise')
  ).property('selectedExercise') 
  
  useDistance: (->
    @get('selectedExercise').get('distance') if @get('selectedExercise')
  ).property('selectedExercise') 

  useDuration: (->
    @get('selectedExercise').get('duration') if @get('selectedExercise')
  ).property('selectedExercise') 

  useCalories: (->
    @get('selectedExercise').get('calories') if @get('selectedExercise')
  ).property('selectedExercise') 

  useWeight: (->
    @get('selectedExercise').get('weight') if @get('selectedExercise')
  ).property('selectedExercise') 

  canSave: (->
    @get('selectedExercise')
  ).property('selectedExercise') 

  actions:
    create: (activity) -> 
      activity.set('exercise', @get('selectedExercise'))
      activity.set('user', @get('currentUser.content'))

      success = (activity) =>
        @set('selectedExercise', null)
        @transitionToRoute('activities', @get('currentUser.content'))
      failure = (response) =>
        console.log response
        @set('errors', @get('content.errors'))
      activity.save().then success, failure
        