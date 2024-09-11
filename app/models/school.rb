class School < ApplicationRecord
  has_many :students, through: :school_class
  has_many :school_classes, dependent: :destroy
end
