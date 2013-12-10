WorkoutWars.CompetitionController = Ember.ObjectController.extend
  deleteMode: false

  actions:
    join: ->
      eventJoin = {
        userId: 1
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
    