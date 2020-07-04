class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :subject
      t.references :teacher
      t.string :title, null:false
      t.datetime :due_date, null: false
    end
  end
end
