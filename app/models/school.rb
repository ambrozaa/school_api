class School < ApplicationRecord
  has_many :school_classes, dependent: :destroy
  has_many :students, through: :school_class
end
