WorkoutWars.ProfileActivitiesController = Ember.ArrayController.extend
  needs: ['calendar']
  sortProperties: ['createdAt']
  sortAscending: false
  currentIndex: 0
  perPage: 10

  currentPage: (->
    endIndex = @get('perPage') + @get('currentIndex')
    @get('model').sortBy('createdAt').reverse().slice(@get('currentIndex'), endIndex)
  ).property('model', 'currentIndex')

  noNextPage: (->
    @get('currentIndex') + @get('perPage') >= @get('model.length')
  ).property('currentIndex', 'model')

  noPreviousPage: (->
    @get('currentIndex') - @get('perPage') < 0
  ).property('currentIndex', 'model')

  actions: 
    nextPage: ->
      currentIndex = @get('currentIndex')
      newIndex = currentIndex + @get('perPage')
      @set('currentIndex',  newIndex)

    previousPage: ->
      currentIndex = @get('currentIndex')
      newIndex = currentIndex - @get('perPage')
      @set('currentIndex',  newIndex)