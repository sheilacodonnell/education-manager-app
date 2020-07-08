class SubmissionsController < ApplicationController
  before_action :load_teacher, :load_subject, :load_assignment

  def index
    @submissions = @assignment.submissions.includes(:student)
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = @assignment.submissions.create!(submission_params)
    if @submission.save
      redirect_to teacher_subject_assignment_submissions_path
    else
      render :new
    end
  end

  private

  def load_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def load_subject
    @subject = Subject.find(params[:subject_id])
  end

  def load_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end

  def submission_params
    params.require(:submission).permit(:student_id, :grade)
  end
end