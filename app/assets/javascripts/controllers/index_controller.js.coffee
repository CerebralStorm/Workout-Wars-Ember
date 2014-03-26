WorkoutWars.IndexController = Ember.ArrayController.extend
  needs: ['currentUser', 'application']
  currentUser: Ember.computed.alias('controllers.currentUser.content')
  selectedExercise: Ember.computed.alias('controllers.application.selectedExercise')
  sortProperties: ['activeness']
  sortAscending: false
  currentCompJoins: []

  recentActivity: (->
    @store.find('competition')
  ).property()

  setCurrentCompJoins: (-> 
    user = @get('currentUser')
    if user
      user.get('competitionJoins').then (joins) =>
        joins.filter (join) =>
          join.get('competitionStatus') != "Finished"

        if @get('selectedExercise')
          newJoins = Ember.A()
          joins.forEach (join) =>
            join.get('competition').then (competition) =>
              selectedId = parseInt(@get('selectedExercise.id'))
              if competition.get('exerciseIds').contains(selectedId)
                newJoins.pushObject(join)
          @set('currentCompJoins', newJoins)
        else
          @set('currentCompJoins', joins)
  ).observes('currentUser.competitionJoins.@each', 'currentUser', 'selectedExercise')

  title: (->
    if @get('selectedExercise')
      'That exerise will count toward the following competitions'
    else
      "My Competitions"
  ).property('selectedExercise')