class TokenGenerator

  SECRET_SALT = ENV['SECRET_SALT']

  def self.generate_token(student_id)
    Digest::SHA256.hexdigest("#{student_id}-#{SECRET_SALT}")
  end

  def self.valid_token?(student_id, token)
    generate_token(student_id) == token
  end

end


