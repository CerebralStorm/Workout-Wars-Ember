WorkoutWars.CompetitionController = Ember.ObjectController.extend
  needs: ['application']
  deleteMode: false

  isJoined: (->
    currentUser = @get('controllers.application.currentUser')
    users = @get('model').get('users')
    result = false
    users.forEach (user, index) ->  
      result = true if user == currentUser        
    result
  ).property()

  actions:
    join: ->
      eventJoin = {
        user: @get('controllers.application.currentUser')
        joinableId: @get("model").get('id')
        joinableType: "Competition"
      }

      eventJoin = @store.createRecord("eventJoin", eventJoin)
      eventJoin.save()

    activateDelete: ->
      @toggleProperty('deleteMode')
    
    cancelDelete: ->
      @set('deleteMode', false)  
      
    confirmDelete: ->
      @set('deleteMode', false) 
      @get("model").deleteRecord()
      @get("model").save()
      @transitionToRoute "competitions"
    
    edit: ->
      @transitionToRoute "competition.edit"
    