WorkoutWars.Feedback = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.Feedback.reopen 
  name: DS.attr('string')
  email: DS.attr('string')
  subject: DS.attr('string')
  content: DS.attr('string')

  validations:
    email:
      presence: true
      format: with: /^[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}$/

    subject:
      presence: true

    content:
      presence: true