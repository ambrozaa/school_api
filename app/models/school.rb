class School < ApplicationRecord
  has_many :classes, class_name: 'SchoolClass', dependent: :destroy
  has_many :students, through: :classes
end
