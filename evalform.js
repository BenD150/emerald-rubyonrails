var data = 
{ completed_survey:  
  [
    {   comment: "hi",
        score: 7,
        student_id: 0
    },  
    {
        comment: "hi",
        score: 7,
        student_id: 1
    },
    {
        comment: "hi",
        score: 7,
        student_id: 2
    }    
  ]
};
function testme(click) {
  alert("current student 0 score: " + data.completed_survey[0].score + ", " + "current student 1 score: " + data.completed_survey[1].score + ", " + "current student 2 score:" + data.completed_survey[2].score);
}

function reset_score1(student){
  data.completed_survey[student].score = 1;
}

function reset_score2(student){
  data.completed_survey[student].score = 2;
}

function reset_score3(student){
  data.completed_survey[student].score = 3;
}

function reset_score4(student){
  data.completed_survey[student].score = 4;
}

function reset_score5(student){
  data.completed_survey[student].score = 5;
}