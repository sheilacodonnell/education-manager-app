class Submission < ApplicationRecord
  belongs_to :subject_student
  belongs_to :assignment
  validates :grade, presence: true
end