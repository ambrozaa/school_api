class Student < ApplicationRecord
  belongs_to :school
  belongs_to :school_class, class_name: 'SchoolClass', foreign_key: 'class_id', counter_cache: true

  validates :first_name, :last_name, :surname, :class_id, :school_id, presence: true
  validates :first_name, :last_name, :surname, format: { with: /\A[a-zA-Zа-яА-ЯёЁ\s-]+\z/ }

  after_create :generate_auth_token

  private

  def generate_auth_token
    self.auth_token = Digest::SHA256.hexdigest("#{self.id}#{Rails.application.credentials.secret_key_base}")
    save
  end
end