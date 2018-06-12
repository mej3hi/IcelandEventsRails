class User < ApplicationRecord
  has_many :event
  attr_accessor :reset_token
  before_save :downcase_email

  validates :name, presence: true,
                   length: { maximum: 255 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :username, presence: true,
                       length: { minimum: 8, maximum: 32 },
                       uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true,
                       length: { minimum: 8, maximum: 32 }

  def downcase_email
    self.email = email.downcase
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def create_reset_digest
    self.reset_token = User.new_token
    #self.reset_token = "12345678"
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

# Returns true if the given token matches the digest.
  def authenticated?(token)
    return false if self.reset_digest.nil?
    BCrypt::Password.new(self.reset_digest).is_password?(token)
  end

end
