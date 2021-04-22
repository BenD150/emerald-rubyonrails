var data = 
[
  {
  project_name: "Team Emerald",
  team_ids: [
      1,
      2,
      3
  ]
  }
]

function formChanged1(click) {
  data[0].team_ids.push(document.getElementsByName("projectname").value);
}
function formChanged2(click) {
  data[0].project_name = document.getElementsByName("teamname").value;
} 