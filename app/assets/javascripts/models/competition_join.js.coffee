WorkoutWars.CompetitionJoin = DS.Model.extend
  competition: DS.belongsTo('competition', { async: true }) 
  user:  DS.belongsTo('user', { embedded: "always" }) 
  total: DS.attr('number')
  rank: DS.attr('number')
  competitionStatus: DS.attr('string')
  power: DS.attr('number')

  hasExercise: (exercise) ->
    @get('competition').then (competition) ->
      return competition.hasExercise(exercise)
