class window.NavbarView extends Backbone.View
  tagName: 'ul'
  className: 'nav navbar-nav'
  id: 'nav-buttons'

  initialize: ->
    @render()
    #make the first navbar item "active" with jQuery
    @$el.children().first().addClass('active')

  render: ->
    _.each @collection.models, ((item) ->
      view = new NavbarItemView(model: item)
      @$el.append view.el
      return
    ), this
    this
# returning itself for chaining calls. syntax bears futher investigation