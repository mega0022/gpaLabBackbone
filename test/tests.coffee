cube = require('../simpleFunctions').cube
isOdd5d = require('../simpleFunctions').isFiveDigitOddNumber
assert = require 'assert'

describe 'testing a coffeescript cube function', ->
  it '3 cubed is 27', ->
    assert.equal 27, cube(3)
  it '-3 cubed is -27', ->
    assert.equal -27, cube(-3)

describe 'incomplete test coverage example', ->
  it '5 is not one', ->
    assert.equal false, isOdd5d(5)
  it '30525 is not one', ->
    assert.equal false, isOdd5d(30524)