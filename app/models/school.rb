class School < ApplicationRecord
  has_many :students
  has_many :school_classes
end
