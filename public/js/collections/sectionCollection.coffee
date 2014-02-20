###
Created by mart2967 on 1/30/14.
###
class window.SectionCollection extends Backbone.Collection
  model: window.Section
  url: '/sections'

  #the "window" namespacing is convinient and fixes a bug where compiled coffeescript hid the classes from the page