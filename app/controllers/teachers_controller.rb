class TeachersController < ApplicationController

  def show
    @teacher = Teacher.find_by(params[:id])
  end
end