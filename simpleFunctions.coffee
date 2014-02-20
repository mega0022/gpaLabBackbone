exports.cube = (number) ->
  number*number*number

exports.isFiveDigitOddNumber = (number) ->
  test = number % 2
  if number >= 10000
    if number <= 99999
      if test == 1
        return true
  false