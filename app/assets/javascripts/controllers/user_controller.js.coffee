WorkoutWars.UserController = Ember.ObjectController.extend
  needs: ['application']

  isCurrentUser: (->
    @get('content') == @get('currentUser.content')
  ).property('content')  
  
  actions:
    edit: ->
      @transitionToRoute "user.edit"