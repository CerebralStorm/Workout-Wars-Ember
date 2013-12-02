WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  isValid: (->
    competition = @get('content')
    if competition
      competition.get('isValid')
    else
      true
  ).property('content.isValid')

  content: null
  name: ""
  errors: ""

  actions:
    saveCompetition: ->
      competition = @get('content')

      if competition
        competition.set('name', @get('name'))
      else
        console.log "saving"
        console.log "#{@get('name')}"
        console.log "#{@get('startDate')}"
        console.log "#{@get('endDate')}"
        console.log "#{@get('lowerLevelRestriction')}"
        console.log "#{@get('upperLevelRestriction')}"
        console.log "#{@get('maxParticipants')}"
        console.log "#{@get('isPublic')}"
        competition = WorkoutWars.Competition.createRecord      
          name: @get('name')
          startDate: @get('startDate')
          endDate: @get('endDate')
          lowerLevelRestriction: @get('lowerLevelRestriction')
          upperLevelRestriction: @get('upperLevelRestriction')
          maxParticipants: @get('maxParticipants')
          isPublic: @get('isPublic')
        competition.save()
        @set('content', competition)
