WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  needs: ['competitionWinConditions', 'currentUser']
  winConditions: Ember.computed.alias('controllers.competitionWinConditions.content')
  errors: Ember.computed.alias('model.errors')

  actions:
    submit: ->
      competition = @get('model')
      competition.set('startDate', moment(@get('model.startDate')).toDate())
      competition.set('endDate', moment(@get('model.endDate')).toDate())
      competition.set('user', @get('controllers.currentUser.content'))
      
      success = (competition) =>
        WorkoutWars.get("flash").success "Your competition was updated"
        @transitionToRoute('competition', competition)
      failure = (response) =>
        WorkoutWars.get("flash").danger "Your competition was not updated"
      competition.save().then success, failure