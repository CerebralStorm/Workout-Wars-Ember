WorkoutWars.ActivityController = Ember.ObjectController.extend
  needs: ['application']
  actions:
    delete: (activity) ->
      if window.confirm "Are you sure?"
        @get("model").deleteRecord()
        @get("model").save().then =>
          @transitionToRoute("activities", @get('controllers.application.currentUser'))          
    
    edit: ->
      @transitionToRoute "activity.edit"
    