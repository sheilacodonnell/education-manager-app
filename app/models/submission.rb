class Submission < ApplicationRecord
  belongs_to :subject_student
  belongs_to :assignment
  validates :grade, presence: true

  # use merge so we can use the past_due scope on assignment without duplicating the code
  scope :with_past_due_assignments, ->{ joins(:assignment).merge(Assignment.past_due) }

end