WorkoutWars.UserNotificationController = Ember.ObjectController.extend
  isEditing: false

  updateActive: (->
    @get('model').save() if @get('model.isDirty')    
  ).observes('model.active')

  actions: 
    edit: ->
      @toggleProperty('isEditing')
      false

    submit: ->
      @get('model').save().then =>
        @set('isEditing', false)