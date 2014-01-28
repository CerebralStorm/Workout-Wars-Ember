WorkoutWars.ActivityController = Ember.ObjectController.extend
  actions:
    delete: (activity) ->
      if window.confirm "Are you sure?"
        @get("model").deleteRecord()
        @get("model").save().then =>
          @transitionToRoute("activities", @get('currentUser.content'))          
    
    edit: ->
      @transitionToRoute "activity.edit"
    