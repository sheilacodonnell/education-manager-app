class CreateSubjectStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :subject_students do |t|
      t.references :subject
      t.references :student
    end
  end
end
