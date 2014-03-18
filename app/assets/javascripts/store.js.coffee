DS.ActiveModelAdapter.reopen namespace: "api/v1"

inflector = Ember.Inflector.inflector
inflector.irregular("activity", "activities")

WorkoutWars.ApplicationAdapter = DS.ActiveModelAdapter.extend()