class RenameSchoolClassesToClasses < ActiveRecord::Migration[7.1]
  def change
    rename_table :school_classes, :classes
  end
end
