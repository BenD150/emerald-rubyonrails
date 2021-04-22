class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  protect_from_forgery with: :null_session

  def select_course!
    if current_user.instructor && !$selected_course
      redirect_to '/courses'
    end
  end
end
