DS.RESTAdapter.reopen namespace: "api/v1"

inflector = Ember.Inflector.inflector
inflector.irregular("activity", "activities")

# WorkoutWars.Store = DS.Store.extend(
#   revision: 11
#   adapter: DS.RESTAdapter.create()
# )

WorkoutWars.ApplicationAdapter = DS.RESTAdapter()
WorkoutWars.ApplicationSerializer = DS.ActiveModelSerializer.extend()


WorkoutWars.Serializer = DS.RESTSerializer.extend
  #Custom serializer used for all models
  normalize: (type, property, hash) ->
    #normalize the `_id`
    json = { id: hash._id }
    delete hash._id

    #normalize the underscored properties
    for prop of hash
      json[prop.camelize()] = hash[prop]

    # delegate to any type-specific normalizations
    return @._super(type, property, json)