Ember.Handlebars.registerBoundHelper 'avatarUrl', (user) ->
  avatarUrl = user.get('avatarUrl')
  if avatarUrl
    new Handlebars.SafeString("<img src=\"#{avatarUrl}\" class=\"img-thumbnail\" />")
  else
    new Handlebars.SafeString("<img src=\"/assets/guest.png\" class=\"img-thumbnail\" />")

  