class SubjectStudent < ApplicationRecord
  belongs_to :subject
  belongs_to :student
  has_many :submissions
  delegate :class_period, to: :subject
  delegate :first_name, :last_name, to: :student
  delegate :name, to: :subject, prefix: true

  attr_accessor :average

  def name
    student.name
  end

  def average
    if submissions.length.zero?
      100
    else
      submissions.with_past_due_assignments.sum(&:grade) / submissions.with_past_due_assignments.length
    end
  end
end