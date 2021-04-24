# README

This README would normally document whatever steps are necessary to get the
application up and running.

<h1><img src="https://cdn1.iconfinder.com/data/icons/business-analytics-6/91/Business_analytics_15-512.png" width="40" height="40"> Team Emerald <img src="https://cdn1.iconfinder.com/data/icons/business-analytics-6/91/Business_analytics_15-512.png" width="40" height="40"></h1>

Zach Salem, Julia Kolnicki, Ben Dollenmayer

# Ruby version
The version of Ruby used is Ruby 2.6.6p146 (2020-03-31 revision 67876) [x86_64-linux]
# System dependencies

# Configuration

# Database creation

# Database initialization

1. write "rails db:seed" in the terminal

# How to run the test suite

2. and then "rails s"
3. follow the link generated in the terminal
4. sign in as an instructor (giles.25@osu.edu, Password1!) or a student (make your own by registering)
5. if you signed in as a student, you must sign in as an instructor to add the student to the course before signing in and seeing more of the student's features

# Services (job queues, cache servers, search engines, etc.)

# Deployment instructions

# The Game of Set - Reloaded

We recreated the "CATME Peer Evaluation" as the "Emerald Peer Evaluation Tool". This site includes a few extra features over the base game, including:

# Extra Credit Features

- Can sign in as multiple different instructors
- Can add more courses to manage

## Building the Project

To try out some JavaScript testing, we used Jest.
This package needs to be installed with `npm install` while in the root directory.
Then, simply open `set.html` in a browser and enjoy!

## Testing

## Style

Style based off of HTML and CSS standards, as well as idiometic JavaScript. Flex box is used to style items in each html page.

## Code Organization

Due to the game logic being implemented in ???, it is largely function-based with a few global variables?

Function sections include:
* Models: Held relations of the database. 
* Controllers: 
*      Application: 
*       Checks if the signed in user is an instructor and whether or not they have selected a course. 
*      Home: 
*       Responsible for rendering the homepage depending on an instructor vs. student, and also lets the instructor add new courses.
*      Student: 
*       Allows an instructor to create students from their own roster and add them to the currently selected course.
*      Team: 
*       Gets all of the students in the current course and allows an instructor to create a team and add the selected students to that team.
*      Project:
*       Renders all of the teams and allows an instructor to create a new project and add teams to it.
*      Survey: 
*       Renders a particular student’s teammates and creates surveys that are filled out by the signed in student.
*      Stat: 
*       Responsible for rendering the statistics for each student’s survey and gives the instructor an overall view of the team’s performance. 
* Views: Held the html for the display of each page with embedded ruby and the javascript at the end of the files for the interactive components.

Global variables include?:
* 