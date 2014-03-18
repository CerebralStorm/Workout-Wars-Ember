DS.Model.reopen saveWhenSettled: ->
  record = this
  new Ember.RSVP.Promise((resolve, reject) ->
    promises = Ember.A()
    record.eachRelationship (rel) ->
      promises.pushObject record.get(rel)  if record.get(rel).then
      return

    Ember.RSVP.Promise.all(promises).then (->
      record.save().then ((result) ->
        resolve result
        return
      ), (reason) ->
        reject reason
        return

      return
    ), (reason) ->
      reject reason
      return

    return
  )