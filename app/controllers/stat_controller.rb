# This controller renders all of the statistics for each project using only a GET request.
class StatController < ApplicationController
  # The GET request must render the stats for each project (for each loop?
  def get_stats
    # For each project
    # Project.surveys
    # look at which surveys
    # Two GET requests: FIrst returns all of the students. The second GET returns the problematic students (average_score_from_teammates: < 3)
    @projects = Project.all
    @projects.each do |project|
      @name = project.name
      @due_date = project.due
    end
  end
end
