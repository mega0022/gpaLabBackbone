mongoose = require 'mongoose'
Schema = mongoose.Schema


Section = new Schema(
  credit: String
  grade: String
  className: String
)

Section = mongoose.model 'Section', Section

module.exports =
  Section : Section

