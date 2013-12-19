WorkoutWars.CompetitionJoin = DS.Model.extend
  competition: DS.belongsTo('competition') 
  user:  DS.belongsTo('user') 