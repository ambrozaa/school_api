class SchoolClass < ApplicationRecord
  belongs_to :school
  has_many :students

  validates :number, :letter, :students_count, presence: true
end
