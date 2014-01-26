Ember.Application.initializer
  name: 'currentUser'

  initialize: (container) ->
    store = container.lookup('store:main')
    attributes = $('meta[name="current-user"]').attr('content')

    if attributes
      user_attributes = JSON.parse(attributes)
      store.find('user', user_attributes.id).then (user) =>
        controller = container.lookup('controller:currentUser').set('content', user)
        container.typeInjection('controller', 'currentUser', 'controller:currentUser')