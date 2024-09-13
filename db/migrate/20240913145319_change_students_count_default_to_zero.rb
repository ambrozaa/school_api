class ChangeStudentsCountDefaultToZero < ActiveRecord::Migration[7.1]
  def change
    change_column_default :school_classes, :students_count, 0
  end
end
