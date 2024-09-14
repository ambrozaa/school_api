class AddNotNullConstraintsToSchoolClasses < ActiveRecord::Migration[7.1]
  def change
    change_column_null :school_classes, :number, false
    change_column_null :school_classes, :letter, false
    change_column_null :school_classes, :students_count, false
  end
end
