WorkoutWars.CompetitionsCreateController = Ember.Controller.extend
  exercises: []

  isValid: (->
    msg = ""
    isValid = true
    value = @get("name")
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

    addExercise: (exercise) ->
      @get('exercises').add(exercise)

    saveCompetition: ->
      competition = {
        name: @get('name')
        startDate: moment(@get('endDate'), "MM-DD-YYYY").toDate()
        endDate: moment(@get('endDate'), "MM-DD-YYYY").toDate()
        maxParticipants: @get('maxParticipants')
        isPublic: @get('isPublic')
        exercises: @get('exercises')
      }
      
      competition = @store.createRecord('competition', competition)
      competition.save().then (competition) =>
        @transitionToRoute 'competition', competition
