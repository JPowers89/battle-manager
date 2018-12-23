class User < ApplicationRecord
  has_many :combats
  before_save :downcase_email, :activate_user

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(:email,
    presence: true,
    length: { maximum: 255 },
    format: { with:  VALID_EMAIL_REGEX},
    uniqueness: { case_sensitive: false })
  validates(:password,
    presence: true,
    length: { minimum: 6 },
    allow_nil: true)
    has_secure_password

  def activate_user
    update_column(:active, true)
  end
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  def downcase_email
    self.email.downcase!
  end
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  def username
    self.email.split("@").first
  end
end
