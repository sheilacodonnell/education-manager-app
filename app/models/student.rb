class Student < ApplicationRecord
  has_many :subject_students
  has_many :subjects, through: :subject_students

  def name
    [first_name, last_name].join(' ')
  end
  
end