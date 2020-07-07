class StudentsController < ApplicationController

  def index
    @students = Student.all.order(grade: :desc)
    @teacher_students = current_teacher.students.uniq
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create!(student_params)
    if @student.valid?
      @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :grade)
  end
end