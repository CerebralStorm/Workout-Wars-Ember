WorkoutWars.User = DS.Model.extend
  activities: DS.hasMany('activity', { embedded: 'load' }) 
  competitionJoins: DS.hasMany('competitionJoin', { embedded: 'load' }) 
  competitionActivities: DS.hasMany('competitionActivity', { embedded: 'load' }) 
  competitions: DS.hasMany('competition', { embedded: 'load' }) 
  challengeAttempts: DS.hasMany('challengeAttempt', { embedded: 'load' }) 
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
  canUpdate: DS.attr('boolean')
  canDelete: DS.attr('boolean')

  handle: (-> 
    return @get('nickname') if @get('nickname')
    return @get('name') if @get('name')
    return @get('email').replace(new RegExp(/@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}$/), " ")
  ).property('nickname', 'name', 'email')

  loggedExerciseNames: (-> 
    exercises = []
    @get('activities').forEach (activity) -> 
      exercises.push(activity.get('exercise.name'))
    exercises.uniq()
  ).property()

  activityStatsTotal: (-> 
    values = {}
    @get('loggedExerciseNames').forEach (name) ->
      values[name] = 0

    @get('activities').forEach (activity) -> 
      key = activity.get('exercise.name')
      values[key] += parseFloat(activity.get('value'))
    values
  ).property()



 