class Student < ApplicationRecord
  belongs_to :school
  belongs_to :school_class, foreign_key: 'class_id', primary_key: 'number'

  validates :first_name, :last_name, :surname, :class_id, :school_id, presence: true

  after_create :generate_auth_token, :student_count

  private

  def generate_auth_token
    self.auth_token = Digest::SHA256.hexdigest("#{self.id}#{Rails.application.credentials.secret_key_base}")
    save
  end

  def student_count
    self.school_class.update(students_count: self.school_class.students_count + 1)
  end
end