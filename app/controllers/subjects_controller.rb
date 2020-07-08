class SubjectsController < ApplicationController
  before_action :load_teacher
  before_action :load_subject, only: [:edit, :update, :remove_student]
  respond_to :html

  def index
    @subjects = @teacher.subjects.includes(:students).order(:class_period)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(create_subject_params)
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
    @subject.update!(update_subject_params)
    if @subject.save
      redirect_to teacher_subjects_path(@teacher)
    else
      render action: :edit
    end
  end

  def remove_student
    student = Student.find_by(id: params[:student_id])
    @subject.students.delete(student)
    redirect_to teacher_subjects_path(@teacher)
  end

  private

  def load_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def load_subject
    @subject = @teacher.subjects.find(params[:id] || params[:subject_id])
  end

  def create_subject_params
    params.require(:subject)
      .permit(:name,
              :class_period)
      .merge(teacher_id: @teacher.id)
  end

  def update_subject_params
    params.require(:subject)
      .permit(:name,
              :class_period)
      .merge(teacher_id: @teacher.id,
             student_ids: @subject.student_ids + params[:subject][:student_ids].reject(&:blank?))
  end
end