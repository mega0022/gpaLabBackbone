###
Created by mart2967 on 1/30/14.
###
class window.SectionCollectionView extends Backbone.View
  events:
    'change': 'change'
    'click button.add' : 'add'
    'click button.manual' : 'makeGPA'

  initialize: ->
    @render()
    @$el.append "<button class='btn btn-default text-right add' style='margin-left:40%; margin-bottom: 50px'>Add Class</button>"

  render: ->
    _.each @collection.models, ((item) ->
      view = new SectionView(model: item)
      @$el.append view.el
      return
    ), this
    this
  # returning itself for chaining calls. syntax bears futher investigation

  change: ->
    creditTotal = 0
    gradesTimesCredits = 0
    gpa = 0
    _.each @collection.models, ((item) ->
      if (item.get 'credit') != '--' and (item.get 'grade') != '--'
        creditTotal += (item.get 'credit') * 1
        gradesTimesCredits += (item.get 'credit') * 1 * gradesToNumbers(item.get 'grade')
    ), this
    gpa = gradesTimesCredits/creditTotal
    sectionList = new window.SectionCollection()
    sectionList.fetch success: ->
      $('#content').html new window.SectionCollectionView(collection: sectionList).$el
      $('#bs-example-navbar-collapse-1').html new window.NavbarView(collection: sectionList).$el
      return
    if creditTotal != 0
      $("#GPADisplay").html("Your GPA: " + gpa.toFixed(2))
    this


  add: ->
    newSection = new Section
    newSection.save()
    @$el.append new SectionView(model: newSection).el
    sectionList = new window.SectionCollection()
    sectionList.fetch success: ->
      $('#content').html new window.SectionCollectionView(collection: sectionList).$el
      $('#bs-example-navbar-collapse-1').html new window.NavbarView(collection: sectionList).$el
      return
    @model.save {}



gradesToNumbers = (grade1)->
  switch grade1
    when "A" then 4.00
    when "A-" then 3.66
    when "B+" then 3.33
    when "B" then 3.00
    when "B-" then 2.66
    when "C+" then 2.33
    when "C" then 2.00
    when "C-" then 1.66
    when "D+" then 1.33
    when "D" then 1.00
    when "D-" then .66
    else 0
