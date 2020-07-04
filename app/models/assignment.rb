class Assignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject

  validates :title, :due_date, presence: true
end