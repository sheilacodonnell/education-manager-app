class StudentsController < ApplicationController
  before_action :load_teacher

  def index
    @students = Student.all.order(grade: :desc)
    @teacher_students = @teacher.students.uniq
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

  private

  def load_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :grade)
  end
end