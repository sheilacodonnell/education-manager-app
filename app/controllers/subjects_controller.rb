class SubjectsController < ApplicationController
  before_action :load_teacher
  before_action :load_subject, only: [:edit, :update]
  respond_to :html

  def index
    @subjects = @teacher.subjects.order(:class_period)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.valid?
      @subject.save
      redirect_to teacher_subjects_path(@teacher)
    else
      render :new
    end
  end

  def edit
  end

  def update

    @subject.update!(subject_params)
    if @subject.save
      redirect_to teacher_subjects_path(@teacher)
    else
      render action: :edit
    end
  end

  private

  def load_teacher
    @teacher = current_teacher
  end

  def load_subject
    @subject = @teacher.subjects.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :class_period, student_ids: []).merge(teacher_id: current_teacher.id)
  end
end