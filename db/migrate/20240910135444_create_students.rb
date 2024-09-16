class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :surname, null: false
      t.integer :class_id, null: false
      t.integer :school_id, null: false

      t.timestamps
    end

  end
end
