WorkoutWars.User = DS.Model.extend
  activities: DS.hasMany('activity', { async: true }) 
  eventJoins: DS.hasMany('eventJoin', { async: true }) 
  competitions: DS.hasMany('competition', { async: true }) 
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
  xp_level: DS.attr('number')

 