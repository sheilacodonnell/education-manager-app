class TeachersController < ApplicationController
  respond_to :html

  def show
    @teacher = Teacher.find(params[:id])
  end
end