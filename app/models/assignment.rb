class Assignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  has_many :submissions
  has_many :subject_students, through: :subject

  validates :title, :due_date, presence: true

  scope :current, -> { where('due_date >= ?', Date.today)}
  scope :past_due, -> { where('due_date < ?', Date.today)}
  scope :due_today, -> { where('due_date = ?', DateTime.current.beginning_of_day)}

  def complete_submission_students
    submissions.includes(:subject_student).map(&:subject_student)
  end

  def incomplete_submission_students
    subject_students - complete_submission_students
  end
end