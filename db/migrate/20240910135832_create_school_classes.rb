class CreateSchoolClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :classes do |t|
      t.integer :number, null: false
      t.string :letter, null: false
      t.integer :students_count, default: 0, null: false
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
