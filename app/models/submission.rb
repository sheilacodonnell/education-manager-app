class Submission < ApplicationRecord
  belongs_to :subject_student
  belongs_to :assignment
  validates :grade, presence: true

  scope :with_past_due_assignments, ->{ joins(:assignment).merge(Assignment.past_due) }

end