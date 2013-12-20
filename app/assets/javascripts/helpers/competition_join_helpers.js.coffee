Ember.Handlebars.registerBoundHelper 'competitionExperience', (competition, user) ->
  value = 0
  joins = competition.get('competitionJoins')
  joins.forEach (join, index) =>
    if join.get('user') == user 
      value = join.get('totalExperience')
  value    

Ember.Handlebars.registerBoundHelper 'competitionRank', (competition, user) ->
  value = 0
  joins = competition.get('competitionJoins')
  joins.forEach (join, index) =>
    if join.get('user') == user 
      value = join.get('rank')
  value 
