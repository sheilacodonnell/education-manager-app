class Submission < ApplicationRecord
  belongs_to :student
  belongs_to :assignment

  after_commit :update_subject_student_average

  def update_subject_student_average
    current_subject_student = StudentSubject.where(student_id: student_id, subject_id: assignment.subject.id)
    current_subject_student.calculate_current_average
  end
end