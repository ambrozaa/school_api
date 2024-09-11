class Student < ApplicationRecord
  belongs_to :school
  belongs_to :school_class

  validates :first_name, :last_name, :surname, :class_id, :school_id, presence: true

end
