WorkoutWars.CompetitionController = Ember.ObjectController.extend
  needs: ['application']

  isJoined: (->
    result = false
    currentUser = @get('controllers.application.currentUser')
    users = @get('model').get('users')
    users.forEach (user, index) ->  
      result = true if user == currentUser   
    result
  ).property('users.@each', 'eventJoins.@each')

  actions:
    join: ->
      eventJoin = {
        user: @get('controllers.application.currentUser')
        joinableId: @get("model").get('id')
        joinableType: "Competition"
      }

      eventJoin = @store.createRecord("eventJoin", eventJoin)
      eventJoin.save().then =>
        location.reload()

    delete: (competition) ->
      if window.confirm "Are you sure?"
        @get("model").deleteRecord()
        @get("model").save().then =>
          @transitionToRoute("competitions")    
    
    edit: ->
      @transitionToRoute "competition.edit"
    