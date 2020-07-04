class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :subject_students
  has_many :students, through: :subject_students
  has_many :assignments
  accepts_nested_attributes_for :students
  
  validates :class_period, inclusion: 1..8

  def available_students
    students = Student.all
    not_available = students.includes(:subjects).where('subjects.class_period =?', self.class_period).references(:subjects)
    students - not_available
  end

  def current_assignments
    assignments.where('due_date >= ?', Date.today)
  end

  def past_assignments
    assignments.where('due_date < ?', Date.today - 1.day)
  end
end
