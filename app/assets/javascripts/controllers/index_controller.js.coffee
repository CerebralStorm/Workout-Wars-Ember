WorkoutWars.IndexController = Ember.ArrayController.extend
  needs: ['currentUser', 'application']
  currentUser: Ember.computed.alias('controllers.currentUser.content')
  selectedExercise: Ember.computed.alias('controllers.application.selectedExercise')
  sortProperties: ['createdAt']
  sortAscending: false
  currentCompJoins: []

  setCurrentCompJoins: (-> 
    user = @get('currentUser')
    if user
      user.get('activeCompetitionJoins').then (joins) =>
        if @get('selectedExercise')
          @set('currentCompJoins', [])
          joins.forEach (join) =>
            join.hasExercise(@get('selectedExercise')).then (result) =>
              @get('currentCompJoins').pushObject(join) if result              
        else
          @set('currentCompJoins', joins)
  ).observes('currentUser.competitionJoins', 'selectedExercise')

  title: (->
    if @get('selectedExercise')
      "#{@get('selectedExercise.name')} will count toward the following competitions"
    else
      "My Competitions"
  ).property('selectedExercise')