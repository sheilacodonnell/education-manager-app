class Student < ApplicationRecord
  include GpaCalculator

  validates :first_name, :last_name, :grade, presence: true

  has_many :subject_students
  has_many :subjects, through: :subject_students
  has_many :assignments, through: :subjects
  has_many :submissions, through: :subject_students
  
  attr_accessor :GRADES, :gpa

  GRADES = ['Freshman', 'Sophomore', 'Junior', 'Senior']

  def self.search(search)
    where(last_name: search) 
  end

  def name
    [first_name, last_name].join(' ')
  end

  def gpa
    grades = subject_students.map(&:average)
    calculate(grades)
  end
end