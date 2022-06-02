class User < ApplicationRecord

  has_secure_password
  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { maximum: 30, minimum: 3 }
  validates :last_name, presence: true, length: { maximum: 30, minimum: 3 }


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false }, length: { maximum: 100 },
            format: { with: VALID_EMAIL_REGEX }
end
