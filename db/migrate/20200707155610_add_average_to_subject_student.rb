class AddAverageToSubjectStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :subject_students, :average, :decimal, precision: 5, scale: 2, null: false, default: 0
  end
end
