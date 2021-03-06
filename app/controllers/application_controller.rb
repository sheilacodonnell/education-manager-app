class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(teacher)
    teacher_path(teacher.id)
  end

  def after_sign_out_path_for(teacher)
    new_teacher_session_path
  end
end
