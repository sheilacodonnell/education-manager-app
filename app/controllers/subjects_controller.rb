class SubjectsController < ApplicationController
  before_action :load_teacher
  respond_to :html

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.create!(subject_params)
    if @subject.save
      redirect_to teacher_path(@teacher)
    else
      flash[:error] = "Could not save subject"
      redirect_to new_subject_path
    end
  end

  private

  def load_teacher
    @teacher = current_teacher
  end

  def subject_params
    params.require(:subject).permit(:name, :class_period).merge(teacher_id: current_teacher.id)
  end
end