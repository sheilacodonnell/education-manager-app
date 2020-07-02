class TeachersController < ApplicationController
  respond_to :html

  def show
    @teacher = Teacher.find_by(params[:id])
  end
end