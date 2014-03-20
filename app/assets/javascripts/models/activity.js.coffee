WorkoutWars.Activity = DS.Model.extend(Ember.Validations.Mixin)
WorkoutWars.Activity.reopen 
  user: DS.belongsTo('user', { async: true }) 
  exercise: DS.belongsTo('exercise', { embedded: "always" }) 
  valuesJson: DS.attr('string')
  createdAt: DS.attr('date')
  
  values: (->
    valueObjects = Ember.A()
    values = JSON.parse(@get('valuesJson'))
    $.each values, (key,value) ->
      item = Ember.Object.create({
        name: key
        value: value
      })
      valueObjects.pushObject(item)
    valueObjects
  ).property('valuesJson')

  validations:
    value:
      numericality:
        greaterThan: 0
        lessThan: 100000


