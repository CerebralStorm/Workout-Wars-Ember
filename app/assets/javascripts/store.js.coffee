DS.RESTAdapter.reopen namespace: "api/v1"

inflector = Ember.Inflector.inflector
inflector.irregular("activity", "activities")

WorkoutWars.ApplicationAdapter = DS.ActiveModelAdapter.extend()

WorkoutWars.ApplicationSerializer = DS.ActiveModelSerializer.extend
  serializeHasMany: (record, json, relationship) ->
    key = relationship.key
    jsonKey = Ember.String.singularize(key) + '_ids'

    json[jsonKey] = []

    record.get(key).forEach( (item) ->
      json[jsonKey].push(item.get('id'))
    )
    return json