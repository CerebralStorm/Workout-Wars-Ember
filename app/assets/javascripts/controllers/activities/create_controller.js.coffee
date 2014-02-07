WorkoutWars.ActivitiesCreateController = Ember.ObjectController.extend
  needs: ['exercises']
  selectedExercise: null

  exercises: (->
    @get('controllers.exercises.content')
  ).property('controllers.exercises')

  setValid: (->
    @set('model.becameValid', true)
  ).observes('selectedExercise') 

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
        