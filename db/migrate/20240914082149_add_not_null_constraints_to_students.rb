class AddNotNullConstraintsToStudents < ActiveRecord::Migration[7.1]
  def change
    change_column_null :students, :first_name, false
    change_column_null :students, :last_name, false
    change_column_null :students, :surname, false
    change_column_null :students, :class_id, false
    change_column_null :students, :school_id, false
  end
end
