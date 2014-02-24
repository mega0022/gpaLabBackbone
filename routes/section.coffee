Section = require('../schemas/schemas').Section

# Populate the database if there are no records
Section.count({},(err, c) ->
  console.log err if err
  if c == 0
    console.log 'Populating database'
    populateDB()
)

exports.addClass = (req, res) ->
  createAndAdd()

exports.findAll = (req, res) ->
  Section.find (err, items) ->
    res.send items


exports.create = (req, res) ->
  newSection = new Section req.body
  console.log 'created section ' + newSection.title
  newSection.save()
  res.send(newSection)

exports.getById = (req, res) ->
  id = req.route.params['id']
  Section.findById id, (err, result) ->
    res.send result

exports.edit = (req, res) ->
  section = req.body
  delete section._id
  ###console.log req###

  id = req.params.id
  Section.update({ _id: id }, { $set: section }, (err, numAffected, raw) ->
    console.log err if err
    console.log 'The number of updated documents was %d', numAffected
    #console.log 'The raw response from Mongo was ', raw



    res.send(section)
  )

populateDB = ->
  sections = [
    {
      className: 'Class 1'
      htmlId: 'class 1'
    },
    {
      className: 'Class 2'
      htmlId: 'class 2'
    },
    {
      className: 'Class 3'
      htmlId: 'class 3'
    },
    {
      className: 'Class 4'
      htmlId: 'class 4'
    }

  ]
  for section in sections
    createAndAdd section
    console.log section.className

createAndAdd = (sec)->
  newSection = new Section(sec)
  newSection.save()