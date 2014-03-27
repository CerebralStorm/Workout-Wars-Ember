WorkoutWars.User = DS.Model.extend
  userExercises: DS.hasMany('userExercise', { async: true })
  competitionJoins: DS.hasMany('competitionJoin', { async: true }) 
  competitionUserExercises: DS.hasMany('competitionUserExercise', { async: true }) 
  competitions: DS.hasMany('competition', { async: true }) 
  challengeAttempts: DS.hasMany('challengeAttempt', { async: true }) 
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
  canUpdate: DS.attr('boolean')
  canDelete: DS.attr('boolean')
  activeCompetitionJoins: []

  handle: (-> 
    return @get('nickname') if @get('nickname')
    return @get('name') if @get('name')
    return @get('email').replace(new RegExp(/@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}$/), " ") if @get('email')
  ).property('nickname', 'name', 'email')

  activityStatsTotal: (-> 
    @get('userExercises').then (userExercises) =>
      values = {}
      userExercises.forEach (activity) -> 
        key = activity.get('exercise.name')
        values[key] = 0 unless values[key] > 0
        values[key] += parseFloat(activity.get('value'))
      values
  ).property('userExercises')

  recentUserExercises: (->
    @get('userExercises').slice(0,10)
  ).property('userExercises.@each')
 