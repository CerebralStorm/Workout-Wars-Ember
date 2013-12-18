WorkoutWars.CompetitionController = Ember.ObjectController.extend
  needs: ['application']

  isJoined: (->
    result = false
    currentUser = @get('controllers.application.currentUser')
    users = @get('model').get('users')
    users.forEach (user, index) ->  
      result = true if user == currentUser   
    result
  ).property('users.@each', 'competitionJoins.@each')

  actions:
    join: ->
      competitionJoin = {
        user: @get('controllers.application.currentUser')
        competition: @get("model")        
      }

      competitionJoin = @store.createRecord("competitionJoin", competitionJoin)
      competitionJoin.save()

    delete: (competition) ->
      if window.confirm "Are you sure?"
        @get("model").deleteRecord()
        @get("model").save().then =>
          @transitionToRoute("competitions")    
    
    edit: ->
      @transitionToRoute "competition.edit"
    