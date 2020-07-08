class SubjectStudent < ApplicationRecord
  belongs_to :subject
  belongs_to :student
  has_many :submissions, through: :students
  delegate :first_name, :last_name, to: :student

  def calculate_current_average
    student_submissions = student.submissions.select{|submission| submission.assignment.subject_id == subject_id}
    student_submissions.sum(&:grade) / student_submissions.length
  end
end