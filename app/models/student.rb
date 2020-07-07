class Student < ApplicationRecord
  has_many :subject_students
  has_many :subjects, through: :subject_students
  has_many :assignments, through: :subjects
  has_many :submissions
  
  attr_accessor :GRADES

  GRADES = ['Freshman', 'Sophomore', 'Junior', 'Senior']

  def name
    [first_name, last_name].join(' ')
  end
  
end