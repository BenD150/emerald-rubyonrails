var data = [
  {
      name: "zach salem",
      project_name: "Game of Set",
      score_for_self: 5,
      average_score_from_teammates: 2.9,
      comments: [
          "good stuff",
          "very good stuff",
          "great stuff"
      ]
  }
]

function loadProblemStudents() {
  document.getElementById("myText").innerHTML = data[0].name + ", project name: " + data[0].project_name + ", self score: " + data[0].score_for_self + ", avg score from teammates: " + data[0].average_score_from_teammates + ", comments: " + data[0].comments[0] + ", " + data[0].comments[1] + ", " + data[0].comments[2] + ".";
}

function dropMenuFunc() {
  document.getElementById("myDropDown").classList.toggle("show");
}

window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i=0; i<dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}