class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :subject_students
  has_many :students, through: :subject_students
  
  validates :class_period, inclusion: 1..8
end