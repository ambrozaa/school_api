class Student < ApplicationRecord
  belongs_to :school
  belongs_to :school_class, foreign_key: 'class_id', primary_key: 'number'

  validates :first_name, :last_name, :surname, :class_id, :school_id, presence: true

  before_create :generate_auth_token

  private

  def generate_auth_token
    self.auth_token = Digest::SHA256.hexdigest("#{self.id}#{Rails.application.credentials.secret_key_base}")
  end
end