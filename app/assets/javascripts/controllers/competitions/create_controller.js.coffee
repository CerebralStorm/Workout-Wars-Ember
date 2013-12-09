WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  isValid: (->
    msg = ""
    isValid = true
    value = @get("name")
    console.log value
    if /^\s+$/.test(value)
      isValid = false
      msg['name'].push "Field can't be empty"

    @set("errors", msg)
    isValid
  ).property('name')

  content: null
  name: ""
  errors: ""

  actions:
    saveCompetition: ->
      competition = @get('model')

      competition = {
        name: @get('name')
        startDate: @get('startDate')
        endDate: @get('endDate')
        lowerLevelRestriction: @get('lowerLevelRestriction')
        upperLevelRestriction: @get('upperLevelRestriction')
        maxParticipants: @get('maxParticipants')
        isPublic: @get('isPublic')
      }

      competition = @store.createRecord('competition', competition)
      competition.save().then ->
        @transitionTo competition
