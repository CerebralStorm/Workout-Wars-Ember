WorkoutWars.ApplicationController = Ember.ObjectController.extend
  needs: ['exercises', 'currentUser', ]
  currentUser: Ember.computed.alias('controllers.currentUser.content')
  errors: Ember.computed.alias('content.errors')
  selectedExercise: null

  exercises: (->
    @get('controllers.exercises.content').sortBy('name')
  ).property('controllers.exercises')

  canSave: (->
    @get('selectedExercise')
  ).property('selectedExercise') 

  actions:
    submit: (activity) -> 
      activity = @get('model')
      activity.set('exercise', @get('selectedExercise'))
      activity.set('user', @get('currentUser'))

      success = (activity) =>
        @set('selectedExercise', null)
        @set('value', null)
        WorkoutWars.get("modalFlash").success "Your activity was created"
      failure = (response) =>
        WorkoutWars.get("modalFlash").danger "Your activity was not created"
      
      activity.save().then success, failure
