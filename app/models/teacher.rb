class Teacher < ApplicationRecord
  has_many :subjects
  has_many :students, through: :subjects
  has_many :assignments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name
    [first_name, last_name].join(' ')
  end

  def available_class_periods
    class_periods = (1..8).to_a
    current_class_periods = subjects.map(&:class_period)
    class_periods - current_class_periods
  end

  def due_now_assignments
    assignments.where('due_date = ?', Date.today)
  end
end
