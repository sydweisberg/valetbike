class User < ApplicationRecord
  validates :identifier, presence: true, numericality: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { maximum: 20, too_long: "%{count} characters is the maximum allowed" }
  validates :first, presence: true
  validates :last, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A(.+)@(.+)\z/, message: "Email invalid"  }
  validates :password, presence: true, length: { in: 8..20, wrong_length: "Password should be  8-20 characters long"  }

  # has_many :rentals
end
