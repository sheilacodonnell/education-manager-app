class SubjectStudent < ApplicationRecord
  belongs_to :subject
  belongs_to :student

  def calculate_current_average
    student_submissions = student.submissions.select{|submission| submission.assignment.subject_id == subject_id}
    student_submissions.sum(&:grade) / student_submissions.length
  end
end