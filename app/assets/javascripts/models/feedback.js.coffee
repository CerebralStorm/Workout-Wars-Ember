WorkoutWars.Feedback = DS.Model.extend
  name: DS.attr('string')
  email: DS.attr('string')
  subject: DS.attr('string')
  content: DS.attr('string')