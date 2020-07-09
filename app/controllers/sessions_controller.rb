class SessionsController < ApplicationController

	def create
		@teacher = Teacher.find_or_create_by!(uid: auth['uid']) do |u|
			u.first_name = auth['info']['first_name']
			u.last_name = auth['info']['last_name']
			u.email = auth['info']['email']
			u.password = auth['uid']
			u.image = auth['info']['image']
		end

      if Teacher.find_by(uid: auth['uid'], email: auth['info']['email']).present?
        @teacher
      else
        @teacher.save!
        session[:teacher_id] = @teacher.id
        teacher
      end
		redirect_to teacher_path(@teacher)
  end

  private
  
  def auth
    request.env['omniauth.auth']
  end
end
