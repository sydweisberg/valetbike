class User < ApplicationRecord
  has_secure_password

  validates :identifier, presence: true, numericality: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { maximum: 20, too_long: "%{count} characters is the maximum allowed" }
  validates :first, presence: true
  validates :last, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A(.+)@(.+)\z/, message: "Email invalid"  }

  # has_many :rentals
end
