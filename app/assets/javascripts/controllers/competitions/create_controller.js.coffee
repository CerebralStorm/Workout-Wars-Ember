WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  needs: ['application', 'competitionWinConditions']
  winConditions: Ember.computed.alias('controllers.competitionWinConditions.content')
  errors: Ember.computed.alias('content.errors')
  selectedWinCondition: null

  actions:
    create: (competition) ->
      competition.set('isPrivate', @get('isPrivate')) if @get('isPrivate')
      competition.set('startDate', moment(@get('startDate')).toDate()) if @get('startDate')
      competition.set('endDate', moment(@get('endDate')).toDate()) if @get('endDate')
      competition.set('user', @get('controllers.application.currentUser'))
      competition.set('competitionWinCondition', @get('selectedWinCondition'))
      
      success = (competition) =>
        @set('startDate', "")
        @set('endDate', "")
        @set('isPrivate', false)
        WorkoutWars.get("flash").success "Your competition was created"
        @transitionToRoute('competition', competition)
      failure = (response) =>
        WorkoutWars.get("flash").danger "Your competition was not created"
      competition.save().then success, failure
