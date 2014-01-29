WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  needs: ['competitionWinConditions']
  selectedWinCondition: null

  winConditions: (->
    @get('controllers.competitionWinConditions.content')
  ).property('controllers.competitionWinConditions')

  actions:
    create: (competition) ->
      competition.set('isPrivate', @get('isPrivate')) if @get('isPrivate')
      competition.set('startDate', moment(@get('startDate')).toDate()) if @get('startDate')
      competition.set('endDate', moment(@get('endDate')).toDate()) if @get('endDate')
      competition.set('user', @get('currentUser.content'))
      
      success = (competition) =>
        @set('startDate', "")
        @set('endDate', "")
        @set('isPrivate', false)
        WorkoutWars.get("flash").success "Your competition was created"
        @transitionToRoute('competition', competition)
      failure = (response) =>
        @set('errors', @get('content.errors'))
        WorkoutWars.get("flash").danger "Your competition was not created"
      competition.save().then success, failure
