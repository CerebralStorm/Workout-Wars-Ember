WorkoutWars.CompetitionController = Ember.ObjectController.extend

  isJoined: (->
    @get('model.competitionJoins').filterBy('user', @get('currentUser.content')).get('length') > 0
  ).property('model.competitionJoins.@each')

  hasPermission: (->
    @get('currentUser.id') == @get('model.creator.id')
  ).property('model', 'currentUser.content')

  numberOfUsers: (->
    @get('model.competitionJoins').get('length')
  ).property('model.competitionJoins')

  actions:
    join: ->
      competitionJoin = @store.createRecord("competitionJoin", {
        user: @get('currentUser.content')
        competition: @get("model")        
      })
      competitionJoin.save()

    leave: ->
      if window.confirm "Are you sure?"
        join = @get('model.competitionJoins').filterBy('user', @get('currentUser.content')).get('firstObject')
        if join 
          join.deleteRecord()
          join.save()

    removeUser: (join) ->
      if window.confirm "Are you sure?"
        join.deleteRecord()
        join.save()
        
    delete: (competition) ->
      if window.confirm "Are you sure?"
        @get("model").deleteRecord()
        @get("model").save().then =>
          @transitionToRoute("competitions")    
    
    edit: ->
      @transitionToRoute "competition.edit"

    addExercise: (exercise) -> 
      return unless exercise 
      competitionExercise = @store.createRecord("competitionExercise", {
        exercise: exercise
        competition: @get("model")        
      })
      competitionExercise.save()    

    removeExercise: (exercise) ->
      exercise.deleteRecord()
      exercise.save()
    