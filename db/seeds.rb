# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    student = Student.create({first:"Zach",last:"Salem",email:"salem.105@osu.edu"})
    teammate = Student.create({first:"Ben",last:"Dollenmayer",email:"dollenmayer.5@osu.edu"})

    User.create({email:"salem.105@osu.edu",password:"Password1!", student:student})

    team = Team.create({name:"Team Emerald"})

    StudentTeam.create({student:student,team:team})
    StudentTeam.create({student:teammate,team:team})

    project = Project.create({name:"Game of Set",due:"2021-05-20T11:59:59"})

    team_project = TeamProject.create({team:team,project:project})

    survey = Survey.create({team_project:team_project,written_by:student})
    teammate_survey = Survey.create({team_project:team_project,written_by:teammate})

    Comment.create({text:"Great Job!",survey:survey,written_for:teammate})
    Comment.create({text:"Way to Go!",survey:teammate_survey,written_for:student})

    Score.create({value:5,survey:survey,student:teammate})
    Score.create({value:5,survey:teammate_survey,student:student})

