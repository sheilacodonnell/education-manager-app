class StudentsController < ApplicationController
  before_action :load_teacher

  def index
    @students = Student.all.includes(:subject_students).order(:last_name)
    @teacher_students = @teacher.students.includes(:subject_students).order(:last_name).uniq
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create!(student_params)
    if @student.valid?
      @student.save
      redirect_to teacher_students_path
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
    @shared_subjects = @student.subjects & @teacher.subjects
    @student_subjects = @student.subject_students.includes(:subject).order('subjects.class_period')
    @submissions  = @student_subjects.collect(&:submissions).flatten
  end

  private

  def load_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :grade)
  end
end