class Teacher < ApplicationRecord
  has_many :subjects
  has_many :students, through: :subjects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name
    [first_name, last_name].join(' ')
  end
end
