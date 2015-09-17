class User < ActiveRecord::Base
  validates :email, :session_token, :password_digest, presence: true
  validates :email, :session_token, uniqueness: true

  after_intialize :ensure_session_token


  # def self.generate_session_token
  #   session[session_token] =
  # end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end


end
