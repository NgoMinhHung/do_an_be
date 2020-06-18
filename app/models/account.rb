class Account < ApplicationRecord
  belongs_to :user

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  validates :password, 
    confirmation: { case_sensitive: true },
    length: { minimum: 8, maximum: 32 }

end
