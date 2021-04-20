# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    user = User.create({email: 'salem.105@osu.edu',password: 'Password1!'})
    teacher = User.create({email: 'giles.72@osu.edu',password: 'Password1!'})
    
    instructor = Instructor.create({user: teacher})
    course = Course.create({name: "Giles Sp21 3901 Sc1"})
    CourseInstructor.create({course: course, instructor: instructor})

    student = Student.create({first: 'Zach',last: 'Salem',email: 'salem.105@osu.edu',user: user})
    teammate = Student.create({first: 'Ben',last: 'Dollenmayer',email: 'dollenmayer.5@osu.edu'})

    team = Team.create({name: 'Team Emerald',course: course})

    StudentTeam.create({student: student,team: team})
    StudentTeam.create({student: teammate,team: team})

    project = Project.create({name: 'Game of Set',due: '2021-05-20T11:59:59'})

    team_project = TeamProject.create({team: team,project: project})

    survey = Survey.create({team_project: team_project,written_by: student})
    teammate_survey = Survey.create({team_project: team_project,written_by: teammate})

    Comment.create({text: 'Great Job!',survey: survey,written_for: teammate})
    Comment.create({text: 'Way to Go!',survey: teammate_survey,written_for: student})
    Comment.create({text: 'Of course I\'m awesome!',survey: survey,written_for: student})
    Comment.create({text: 'I\'m great, obviously.',survey: teammate_survey,written_for: teammate})

    Score.create({value: 4,survey: survey,student: teammate})
    Score.create({value: 4,survey: teammate_survey,student: student})
    Score.create({value: 5,survey: survey,student: student})
    Score.create({value: 5,survey: teammate_survey,student: teammate})

