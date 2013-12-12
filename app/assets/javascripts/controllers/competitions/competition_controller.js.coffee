WorkoutWars.CompetitionController = Ember.ObjectController.extend
  needs: ['application']

  isJoined: (->
    currentUser = @get('controllers.application.currentUser')
    users = @get('model').get('users')
    result = false
    users.forEach (user, index) ->  
      result = true if user == currentUser        
    result
  ).property('model', 'content')

  actions:
    join: ->
      eventJoin = {
        user: @get('controllers.application.currentUser')
        joinableId: @get("model").get('id')
        joinableType: "Competition"
      }

      eventJoin = @store.createRecord("eventJoin", eventJoin)
      eventJoin.save()
      location.reload()

    delete: (competition) ->
      if window.confirm "Are you sure?"
        @get("model").deleteRecord()
        @get("model").save()
        @transitionToRoute("competitions").then -> 
          location.reload()     
    
    edit: ->
      @transitionToRoute "competition.edit"
    