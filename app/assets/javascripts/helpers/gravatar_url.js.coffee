Ember.Handlebars.registerBoundHelper 'gravatarUrlSmall', (user) ->
  avatarUrl = user.get('avatarUrl')
  if avatarUrl
    new Handlebars.SafeString("<img src=\"#{avatarUrl}?s=50&d=http://www.workout-wars.com/assets/guest-sml.png\" class=\"img-thumbnail\" />")

Ember.Handlebars.registerBoundHelper 'gravatarUrlLarge', (user) ->
  avatarUrl = user.get('avatarUrl')
  if avatarUrl
    new Handlebars.SafeString("<img src=\"#{avatarUrl}?s=200&d=http://www.workout-wars.com/assets/guest-lrg.png\" class=\"img-rounded\" />")