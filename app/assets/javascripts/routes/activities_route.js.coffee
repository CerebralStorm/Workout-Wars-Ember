WorkoutWars.ActivitiesRoute = Ember.Route.extend
  model: ->
    @modelFor('profile').get('activities')

  setupController: (controller, model) ->
    console.log model
    events = []  
    model.forEach (activity) ->
      events.push
        name: activity.get('exercise.name')
        start: moment(activity.get('createdAt')).toDate()
        end: moment(activity.get('createdAt')).add(2, 'hours')
    @controllerFor('calendar').set 'content', events
    controller.set('content', model)