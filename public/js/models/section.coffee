  class window.Section extends Backbone.Model
    urlRoot: '/section'
    idAttribute: '_id' #conforming to mongodb id syntax
    initialize: ->
      console.log 'Initializing a Section'

    defaults:
      className: 'Class Name'
      htmlId: '#'
      credit: '--'
      grade: '--'
