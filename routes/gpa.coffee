formString = '<div>\n
    <H1> GPA Calculator</H1>\n
</div>\n
\n
\n
<form method="post" action="/gpa">\n
    <label>Class 1\n
    <br />\n
    <select id ="grade1" name="grade1">\n
        <option selected="selected" value=0>-select grade-</option>\n
        <option value="A">A</option>\n
        <option value="A-">A-</option>\n
        <option value="B+">B+</option>\n
        <option value="B">B</option>\n
        <option value="B-">B-</option>\n
        <option value="C+">C+</option>\n
        <option value="C">C</option>\n
        <option value="C-">C-</option>\n
        <option value="D+">D+</option>\n
        <option value="D">D</option>\n
        <option value="D-">D-</option>\n
        <option value="F">F</option>\n
    </select>\n
\n
\n
    <br />\n
\n
    <select name="credit1">\n
        <option selected="selected" value=0>-select credit-</option>\n
        <option value=1>1</option>\n
        <option value=2>2</option>\n
        <option value=3>3</option>\n
        <option value=4>4</option>\n
        <option value=5>5</option>\n
    </select>\n
    </label>\n
\n
\n
\n
<br />\n
\n
\n
    <label>Class 2\n
    <br />\n
    <select id ="grade2" name="grade2">\n
        <option selected="selected" value=0>-select grade-</option>\n
        <option value="A">A</option>\n
        <option value="A-">A-</option>\n
        <option value="B+">B+</option>\n
        <option value="B">B</option>\n
        <option value="B-">B-</option>\n
        <option value="C+">C+</option>\n
        <option value="C">C</option>\n
        <option value="C-">C-</option>\n
        <option value="D+">D+</option>\n
        <option value="D">D</option>\n
        <option value="D-">D-</option>\n
        <option value="F">F</option>\n
    </select>\n
\n
    <br />\n
\n
    <select name="credit2">\n
        <option selected="selected" value=0>-select credit-</option>\n
        <option value=1>1</option>\n
        <option value=2>2</option>\n
        <option value=3>3</option>\n
        <option value=4>4</option>\n
        <option value=5>5</option>\n
    </select>\n
    </label>\n
\n
\n
\n
\n
<br />\n
\n
\n
    <label>Class 3\n
        <br />\n
        <select id ="grade3" name="grade3">\n
            <option selected="selected" value=0>-select grade-</option>\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="D-">D-</option>\n
            <option value="F">F</option>\n
        </select>\n
\n
        <br />\n
\n
        <select name="credit3">\n
            <option selected="selected" value=0>-select credit-</option>\n
            <option value=1>1</option>\n
            <option value=2>2</option>\n
            <option value=3>3</option>\n
            <option value=4>4</option>\n
            <option value=5>5</option>\n
        </select>\n
    </label>\n
\n
\n
\n
\n
<br />\n
\n
\n
    <label>Class 4\n
        <br />\n
        <select id="grade4" name="grade4">\n
            <option value=0>-select grade-</option>\n
            <option value="A">A</option>\n
            <option value="A-">A-</option>\n
            <option value="B+">B+</option>\n
            <option value="B">B</option>\n
            <option value="B-">B-</option>\n
            <option value="C+">C+</option>\n
            <option value="C">C</option>\n
            <option value="C-">C-</option>\n
            <option value="D+">D+</option>\n
            <option value="D">D</option>\n
            <option value="D-">D-</option>\n
            <option value="F">F</option>\n
        </select>\n
\n
        <br />\n
\n
        <select name="credit4">\n
            <option value=0>-select credit-</option>\n
            <option value=1>1</option>\n
            <option value=2>2</option>\n
            <option value=3>3</option>\n
            <option value=4>4</option>\n
            <option value=5>5</option>\n
        </select>\n
    </label>\n
\n
\n
<br />\n
<input type="submit" id="submit" value="submit">\n
</form>\n'

headerStr = '<!DOCTYPE html>\n
<html>\n
<head>\n
    <title>GPA calculator</title>\n
</head>\n
<body>\n'

footerStr = '</body>\n</html>'

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

numbersToArray = (grade1,grade2, grade3, grade4) ->
  gradesArr = [0,0,0,0]
  gradesArr[0] = gradesToNumbers(grade1)
  gradesArr[1] = gradesToNumbers(grade2)
  gradesArr[2] = gradesToNumbers(grade3)
  gradesArr[3] = gradesToNumbers(grade4)
  return gradesArr

creditsToArr = (credit1, credit2, credit3, credit4) ->
  creditArr = [0,0,0,0]
  creditArr[0] = credit1
  creditArr[1] = credit2
  creditArr[2] = credit3
  creditArr[3] = credit4
  return creditArr

gradeIt = (grades, credits) ->
  gradeCredits = (grades[0] * credits[0]) + (grades[1] * credits[1]) + (grades[2] * credits[2]) + (grades[3] * credits[3])
  creditTotal = credits[0] * 1 + credits[1] * 1 + credits[2] * 1 + credits[3] * 1
  if creditTotal == 0 then return "Missing Information"
  gpa = (gradeCredits/creditTotal).toFixed(3)
  return gpa




exports.gpaResponse = (req, res) ->
  res.render 'gpa'

exports.gpaPostResponse = (req, res) ->
  res.send headerStr + formString + '<p>Your GPA is ' + gradeIt(numbersToArray(req.body.grade1,req.body.grade2,req.body.grade3, req.body.grade4)
    ,creditsToArr(req.body.credit1, req.body.credit2, req.body.credit3, req.body.credit4)) + '</p>' + footerStr

module.exports.numbersToArray = numbersToArray
module.exports.creditsToArr = creditsToArr
module.exports.gradeIt = gradeIt
module.exports.gradesToNumbers = gradesToNumbers































