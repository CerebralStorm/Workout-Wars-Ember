WorkoutWars.CompetitionController = Ember.ObjectController.extend
  needs: ['application']

  isJoined: (->
    result = false
    currentUser = @get('controllers.application.currentUser')
    joins = @get('model').get('competitionJoins')
    joins.forEach (join, index) ->
      result = true if join.get('user') == currentUser   
    result
  ).property('competitionJoins.@each', 'users.@each')

  actions:
    join: ->
      competitionJoin = {
        user: @get('controllers.application.currentUser')
        competition: @get("model")        
      }

      competitionJoin = @store.createRecord("competitionJoin", competitionJoin)
      competitionJoin.save()

    start: ->
      competition = @get("model") 
      competition.set('started', true)
      competition.save()

    delete: (competition) ->
      if window.confirm "Are you sure?"
        @get("model").deleteRecord()
        @get("model").save().then =>
          @transitionToRoute("competitions")    
    
    edit: ->
      @transitionToRoute "competition.edit"
    