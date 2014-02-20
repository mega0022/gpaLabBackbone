###
Created by mart2967 on 1/30/14.
###
class window.SectionCollectionView extends Backbone.View
  events:
    'change': 'change'

  initialize: ->
    @render()

  render: ->
    _.each @collection.models, ((item) ->
      view = new SectionView(model: item)
      @$el.append view.el
      return
    ), this
    this
    # returning itself for chaining calls. syntax bears futher investigation

  change: ->
    $("#GPADisplay").html("Your GPA: " + 41)
#    _.each @collection.models, ((item) ->
#      view = new SectionView(model: item)
#      @$el.append view.el
#      return
#    ), this
#    this




  makeGPA = () ->
    _.each @collection.section, ((item) ->
      gradesArr = []
      gradesArr[-1] = gradesToNumbers(item.grade)
    )
    42
  #    _.each @collection.models, ((item) ->
  #      view = new NavbarItemView(model: item)
  #      @$el.append view.el
  #      return
  #    ), this



  gradesToNumbers = (grade1)->
    switch grade1
      when "A" then 4
      when "A-" then 3.666
      when "B+" then 3.333
      when "B" then 3
      when "B-" then 2.666
      when "C+" then 2.333
      when "C" then 2
      when "C-" then 1.666
      when "D+" then 1.333
      when "D" then 1
      when "D-" then .666
      else 0
