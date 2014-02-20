class window.NavbarItemView extends Backbone.View
  tagName: 'li'

  #Defining the template html explicitly rather than selecting it from a hidden element
  #Convinient for small snippets like this, not for anything much bigger
  template: _.template '<a href="#<%= htmlId %>"><%= className %></a>'

  events:
    click: 'makeActive'

  initialize: ->
    @render()

  render: ->
    @$el.html @template(@model.toJSON())
    this

  makeActive: ->
    #these methods are from jQuery, they work here because $el is a html DOM element
    @$el.siblings().removeClass('active')
    @$el.addClass('active')
    this