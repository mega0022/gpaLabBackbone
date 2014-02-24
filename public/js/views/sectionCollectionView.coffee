###
Created by mart2967 on 1/30/14.
###
class window.SectionCollectionView extends Backbone.View
  events:
    'change': 'change'
    'click button.add' : 'add'

  initialize: ->
    @$el.append "<button class='btn btn-default text-right add' style='margin-left:40%; margin-bottom: 50px'>Add Class</button>"
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
    $("#GPADisplay").html("Your GPA: " + makeGPA())
#    _.each @collection.models, ((item) ->
#      view = new SectionView(model: item)
#      @$el.append view.el
#      return
#    ), this
#    this


  add: ->
    newSection = new Section
    newSection.save()
    @$el.append new SectionView(model: newSection).el
    @model.save {}



  makeGPA = () ->
    _.each @collection(@model.toJSON) ->
      #PUT ITEM IN HERE SOMEWHERE, CAPS LOCK FOR IMPORTANCE
      gradesArr = []
      gradesArr[-1] = gradesToNumbers(section.grade)
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
