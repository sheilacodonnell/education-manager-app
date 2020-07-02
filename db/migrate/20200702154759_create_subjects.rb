class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.integer :class_period
      t.references :teacher
    end
  end
end
