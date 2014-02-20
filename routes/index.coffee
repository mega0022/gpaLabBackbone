
exports.index = (req, res) ->
  res.locals = {
    title: 'GPA Calculator',
    description: 'Enter your grades and credits and see your GPA'
    ###'An example of one way to build a powerful web app based on Node.js'###
  }
  res.render 'index'
