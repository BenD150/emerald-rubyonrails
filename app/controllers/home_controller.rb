# This controller generates the homepage using a GET request
class HomeController < ApplicationController
  protect_from_forgery except: :select
  protect_from_forgery except: :create
  require 'date'


  # The GET request must render the
  #   - projects, if student
  #   - courses, if instructor and no course selected
  #   - projects, if instructor and course selected
  #   - a sign in message, if unathenticated
  def index
    if user_signed_in? && current_user.student
      @student_projects = current_user.student.team_projects.collect{ |team_project|
        {
          class_name: team_project.team.course.name,
          team_name: team_project.team.name,
          project_name: team_project.project.name,
          action_link: if team_project.comments_for_team(current_user.student).empty? then "/survey/complete?id="+team_project.id.to_s elsif team_project.project.due > DateTime.now() then "/survey/view?id="+team_project.id.to_s else nil end,
          action_text: if team_project.comments_for_team(current_user.student).empty? then "Complete" elsif team_project.project.due > DateTime.now() then "View" else "Awaiting Results" end,
          due: team_project.project.due.in_time_zone('Eastern Time (US & Canada)').strftime('%Y-%m-%d %I:%M:%S %p')
        }
      }
    elsif user_signed_in? && current_user.instructor
      redirect_to '/courses'
    end
  end

  # The GET request sets the unselects course global variable and reloads the home page
  def courses
    unless user_signed_in? && current_user.instructor
      render :nothing => true, :status => :unauthorized
    end
    
    $selected_course = nil

    @courses = current_user.instructor.courses.collect{ |course|
      {
        name: course.name,
        id: course.id
      }
    }

    render :template => "home/index"
  end

  # The POST request sets the selected course global variable and reloads the home page
  def course
    unless user_signed_in? && current_user.instructor
      render :nothing => true, :status => :unauthorized
    end
    
    $selected_course = Course.where({id: params[:id]}).first

    @course_projects = $selected_course.projects.collect{ |project|
      {
        project_name: project.name,
        team_names: project.teams.reduce(''){|names, team| names + team.name + ', '}[0..-3],
        due: project.due.in_time_zone('Eastern Time (US & Canada)').strftime('%Y-%m-%d %I:%M:%S %p')
      }
    }

    render :template => "home/index"
  end


  # The POST request that creates a new course belonging to an instructor
  def create
    course_name = params[:text].to_s
    course = Course.create(name: course_name)
    CourseInstructor.create(course: course, instructor: current_user.instructor)

    @courses = current_user.instructor.courses.collect{ |course|
      {
        name: course.name,
        id: course.id
      }
    }

    render :template => "home/index"
  end

end


