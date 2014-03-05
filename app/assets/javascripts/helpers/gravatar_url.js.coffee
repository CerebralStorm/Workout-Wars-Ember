Ember.Handlebars.registerBoundHelper 'gravatarUrlSmall', (user) ->
  avatarUrl = user.get('avatarUrl')
  if avatarUrl
    new Handlebars.SafeString("<img src=\"#{avatarUrl}?s=50&d=http://workoutwars-review.herokuapp.com/assets/guest-sm.png\" class=\"img-thumbnail\" />")

Ember.Handlebars.registerBoundHelper 'gravatarUrlLarge', (user) ->
  avatarUrl = user.get('avatarUrl')
  if avatarUrl
    new Handlebars.SafeString("<img src=\"#{avatarUrl}?s=200&d=http://workoutwars-review.herokuapp.com/assets/guest-lg.png\" class=\"img-rounded\" />")