class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(teacher)
    teacher_path(teacher.id)
  end

  private

  def sign_up_params
    params.require(:teacher).permit(:email, :password, :first_name, :last_name)
  end
end