var current_tempteamname = "default";
var data = 
{ completed_survey:  
  [
    {   team_name: "default team name",
        student_ids: []
    },    
  ]
};
function testme(click) {
  //alert("team name for elt0: " + data.completed_survey[0].team_name + ", " + "student ids for elt0: " + data.completed_survey[0].student_id.join());
  alert("team name for elt0 is " + data.completed_survey[0].team_name + ", and the student ids listed under that team are: " + data.completed_survey[0].student_ids[0] + data.completed_survey[0].student_ids[1] + data.completed_survey[0].student_ids[2] + data.completed_survey[0].student_ids[3] + data.completed_survey[0].student_ids[4]);
}

function setstudent(student){
  student++;
  //first, find the team_name within the text box. if does not exist, add another element to data.completed_survey and set a key, team_name, to the one in the
  //text box and then add the student id to the student_id key array. 
  data.completed_survey[0].student_ids.push(String(student)); 
}

/*document.addEventListener("click", formteam);
function formteam(){
  var input = document.getElementById("userInputTeamName").value;
  //subButton.addEventListener('click', )
  current_tempteamname = input;
}*/

function formChanged(click) {
  current_tempteamname = document.getElementsByName("teamname").value;
}