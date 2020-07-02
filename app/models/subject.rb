class Subject < ApplicationRecord
  belongs_to :teacher
  has_many :students

  validates :class_period, inclusion: 1..8
end