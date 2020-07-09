class AddGpaToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :gpa, :decimal, precision: 5, scale: 2, null: false, default: 0
  end
end
