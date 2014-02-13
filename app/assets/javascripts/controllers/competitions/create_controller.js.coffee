WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  needs: ['application', 'competitionWinConditions']
  winConditions: Ember.computed.alias('controllers.competitionWinConditions.content')
  errors: Ember.computed.alias('model.errors')

  actions:
    submit: ->
      competition = @get('model')
      competition.set('isPrivate', @get('isPrivate')) if @get('isPrivate')
      competition.set('startDate', moment(@get('model.startDate')).toDate())
      competition.set('endDate', moment(@get('model.endDate')).toDate())
      competition.set('user', @get('controllers.application.currentUser'))
      
      success = (competition) =>
        @set('startDate', "")
        @set('endDate', "")
        @set('isPrivate', false)
        WorkoutWars.get("flash").success "Your competition was updated"
        @transitionToRoute('competition', competition)
      failure = (response) =>
        WorkoutWars.get("flash").danger "Your competition was not updated"
      competition.save().then success, failure
