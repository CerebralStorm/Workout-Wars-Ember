WorkoutWars.User = DS.Model.extend
  userExercises: DS.hasMany('userExercise', { async: true })
  competitionJoins: DS.hasMany('competitionJoin', { async: true }) 
  competitionUserExercises: DS.hasMany('competitionUserExercise', { async: true }) 
  competitions: DS.hasMany('competition', { async: true }) 
  challengeAttempts: DS.hasMany('challengeAttempt', { async: true }) 
  userNotifications: DS.hasMany('userNotification', { async: true }) 
  name: DS.attr('string')
  nickname: DS.attr('string')
  email: DS.attr('string')
  gender: DS.attr('string')
  address: DS.attr('string')
  phone: DS.attr('string')
  weight: DS.attr('number')
  height: DS.attr('number')
  age: DS.attr('number')
  level: DS.attr('number')
  experience: DS.attr('number')
  nextLevelExperience: DS.attr('number')
  previousLevelExperience: DS.attr('number')
  avatarUrl: DS.attr('string')
  handle: DS.attr('string')
  canUpdate: DS.attr('boolean')
  canDelete: DS.attr('boolean')

  activeCompetitionJoins: (->
    @get('competitionJoins').then (joins) ->
      joins.filter (join) =>
        join.get('competitionStatus') != "Finished"
  ).property('competitionJoins')

  exerciseStatsTotal: (-> 
    @get('userExercises').then (userExercises) =>
      values = {}
      userExercises.forEach (userExercise) -> 
        key = userExercise.get('exercise.name')
        values[key] = 0 unless values[key] > 0
        values[key] += parseFloat(userExercise.get('value'))
      
      results = Ember.A()
      $.each values, (key, value) ->
        object = {}
        object['name'] = key
        object['value'] = value
        results.pushObject(object)
      results
  ).property('userExercises')

  exerciseExperienceTotal: (-> 
    @get('userExercises').then (userExercises) =>
      values = {}
      userExercises.forEach (userExercise) -> 
        key = userExercise.get('exercise.name')
        values[key] = 0 unless values[key] > 0
        values[key] += parseFloat(userExercise.get('totalExperience'))
      values
  ).property('userExercises')

  recentUserExercises: (->
    Ember.ArrayProxy.extend(Ember.SortableMixin).create({content: @get('userExercises'), sortProperties: ['createdAt'], sortAscending: false}).slice(0,5)
  ).property('userExercises.@each')

  levelProgress:(->
    expThisLevel = @get('nextLevelExperience') - @get('previousLevelExperience')
    expSince = @get('experience') - @get('previousLevelExperience')
    (expSince / expThisLevel) * 100
  ).property('nextLevelExperience', 'experience')
 