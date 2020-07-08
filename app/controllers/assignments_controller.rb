class AssignmentsController < ApplicationController
  before_action :load_teacher
  before_action :load_subject

  def index
    @current_assignments = @subject.assignments.current.order(:due_date)
    @past_assignments = @subject.assignments.past_due.order(due_date: :desc)
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.create!(assignment_params)
    if @assignment.save
    redirect_to teacher_subject_assignments_path
    else
      render :new
    end
  end

  private

  def load_teacher
    @teacher = current_teacher
  end

  def load_subject
    @subject = Subject.find(params[:subject_id])
  end

  def assignment_params
    params.require(:assignment).permit(:title, :due_date).merge(teacher_id: current_teacher.id, subject_id: @subject.id)
  end
end