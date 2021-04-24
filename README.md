
<h1><img src="https://cdn1.iconfinder.com/data/icons/business-analytics-6/91/Business_analytics_15-512.png" width="40" height="40"> Team Emerald <img src="https://cdn1.iconfinder.com/data/icons/business-analytics-6/91/Business_analytics_15-512.png" width="40" height="40"></h1>

Zach Salem, Julia Kolnicki, Ben Dollenmayer

# Peer Evaluation Tool
We recreated the "CATME Peer Evaluation" as the "Emerald Peer Evaluation Tool". This site includes a few extra features in addition to the general requirements, including:
- User registration and authentication using the `devise` gem
- Ability for multiple different instructors to sign in 
- An instructor can manage a number of different courses, each with different students and projects
- A student can be a part of multiple groups simultaneously
- This tool can link a brand new registered user to an existing team if the email matches the one that the instructor provided 

# Building the Site
To build the site, complete the following steps:
1. Clone the repository
2. `cd emerald-rubyonrails`
3. Install bundler with `gem install bundler`
4. Now, move onto the PostgreSQL Installation and Database Creation sections to continue set-up

# PostgreSQL Installation
We decided to use PostgreSQL to make deploying to Heroku easier. The following commands MUST be entered in the terminal in the project directory to avoid running into errors when doing `bundle install`:
1. `apt show postgresql`
2. `sudo apt install postgresql postgresql-contrib`
3. If you run `bundle install` now, it will still likely give you an error. Then, run:
4. `sudo apt install postgresql-contrib libpq-dev`
5. `bundle install` should work properly now. Move onto the Database Creation section below.

# Database Creation
After PostgreSQL has been installed and `bundle install` works successfully, do the following commands in the project directory:
1. `sudo -u postgres psql`
2. `ALTER USER postgres PASSWORD 'MyPassword';`
3. Type `\q` to exit the Postgres console 
4. `rake db:setup`

# Database Seeding
After PostgreSQL has been installed and the database has been created successfully, run the following commands if you wish to put sample data in the database:
1. `rails db:seed`

# Starting the Rails Server 
After ALL of the previous steps have been completed, run the following command to start the rails server:
1. `rails s`
2. While the server is running, navigate to http://localhost:3000 to see the Emerald Peer Evaluation Tool

# Utilizing the Seeded Data
If you chose to seed the sample data into the database, here is some information that may be useful to you:
- A student account is available to use with the login information of:
  * Username: salem.105@osu.edu
  * Password: Password1!
    
- An instructor account is also available for use with the following login information:
  * Username: giles.25@osu.edu
  * Password: Password1!
    
In addition to these accounts, there is other useful data in the database including sample projects, survey scores, and comments. It can all be seen in the `seeds.rb` file. 

# Heroku Access
The site is also deployed to Heroku. It can be navigated to with the following link:
- cse-3901-final-project.herokuapp.com

It includes all of the seeded data described above.

# Ruby version
The version of Ruby used is Ruby 2.6.6p146 (2020-03-31 revision 67876) [x86_64-linux]
# System dependencies
There are a few system dependencies for the peer evaluation tool, including:
- Ruby on Rails
- Devise (gem for authentication)
- Postgres for database creation and initialization

# Testing
Thorough testing was done for each GET and POST endpoint in the `routes.rb` file, along with the rendering of each page's components.

# Style

Style based off of HTML, CSS, [Ruby](http://ruby-doc.org/), and Ruby on Rails standards. In addition, flex box is used to style items on each HTML page.

# Code Organization
File sections include:
* Models: Held relations of the database. See the `Peer Eval Tool - Database Diagram` image in the repository for a more in-depth view of the database.
- Controllers: 
  * Application: Checks if the signed in user is an instructor and whether or not they have selected a course. 
  * Home: Responsible for rendering the homepage depending on an instructor vs. student, and also lets the instructor add new courses.
  * Student: Allows an instructor to create students from their own roster and add them to the currently selected course.
  * Team: Gets all of the students in the current course and allows an instructor to create a team and add the selected students to that team.
  * Project: Renders all of the teams and allows an instructor to create a new project and add teams to it.
  * Survey: Renders a particular student’s teammates and creates surveys that are filled out by the signed in student.
  * Stat: Responsible for rendering the statistics for each student’s survey and gives the instructor an overall view of the team’s performance. 

- Views: Held the HTML for the display of each page with embedded ruby and the javascript at the end of the files for the interactive components. There are also views generated by `devise` for the login and registration pages.
The views include a detailed homepage depending on a student vs. instructor, a student, team, and project creation page, as well as a comprehensive survey results page with options for an instructor to see any problematic students. 
    * The Devise folder contains various views for user registration and login
    * `home/index.html.erb`: Contains the data that is rendered on the site's landing page, and varies depending on the student or instructor
    * `project/index.html.erb`: Page that allows an instructor to add projects to teams
    * `shared/_navbar.html.erb`: Partial which contains a responsive navigation bar for both students and instructor
    * `stat/index.html.erb`: The page where survey results and problematic students are displayed.
    * `student/index.html.erb`: An instructor can add students here 
    * `survey/complete.html.erb`: Renders the survey that students fill out
    * `survey/view.html.erb`: Allows students to view the results of a completed survey 
    * `team/index.html.erb`: The page where an instructor can add students to teams
  
Global Variables
* `$selected_course`: The instructor's currently selected course