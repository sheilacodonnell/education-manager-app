class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.references :student
      t.references :assignment
      t.decimal :grade, precision: 5, scale: 2, null: false, default: 0
    end
  end
end
