WorkoutWars.ApplicationController = Ember.ObjectController.extend
  needs: ['exercises']
  currentUser: null
  selectedExercise: null

  exercises: (->
    @get('controllers.exercises.content')
  ).property('controllers.exercises')

  setValid: (->
    @set('model.becameValid', true)
  ).observes('selectedExercise') 

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
      activity.set('user', @get('currentUser'))

      success = (activity) =>
        @set('selectedExercise', null)
        @set('reps', null)
        @set('distance', null)
        @set('duration', null)
        @set('weight', null)
        @set('calories', null)
        WorkoutWars.get("modalFlash").success "Your activity was created"
      failure = (response) =>
        WorkoutWars.get("modalFlash").danger "Your activity was not created"
        console.log response
        @set('errors', @get('content.errors'))
      activity.save().then success, failure

  init: ->
    raw_attributes = $('meta[name="current-user"]').attr('content')
    if raw_attributes 
      attributes = JSON.parse(raw_attributes)
      @store.find("user", attributes.id).then (user) =>
        @set('currentUser', user)
