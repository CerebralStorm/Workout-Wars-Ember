WorkoutWars.ActivityController = Ember.ObjectController.extend
  needs: ['application']
  actions:
    delete: (activity) ->
      if window.confirm "Are you sure?"
        @get("model").deleteRecord()
        @get("model").save()
        @transitionToRoute("activities", @get('controllers.application.currentUser')).then -> 
          location.reload() 
    
    edit: ->
      @transitionToRoute "activity.edit"
    