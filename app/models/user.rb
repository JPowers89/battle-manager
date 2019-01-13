# frozen_string_literal: true

# All users of the system must have a valid user record.
# Represents logged in user
class User < ApplicationRecord
  has_many :combats, dependent: :destroy
  after_save :downcase_email, :activate_user

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates(:email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false })
  validates(:password,
            presence: true,
            length: { minimum: 6 },
            allow_nil: true)
  has_secure_password

  def activate_user
    update_column(:active, true)
  end

  def self.digest(string)
    cost = if ActiveModel::SecurePassworrd.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def downcase_email
    email.downcase!
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def username
    email.split('@').first
  end
end
