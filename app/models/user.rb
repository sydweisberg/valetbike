class User < ApplicationRecord
  validates_presence_of    :identifier
  validates_uniqueness_of  :identifier
  attribute :username, :string
  attribute :first, :string
  attribute :last, :string
  attribute :email, :string
  attribute :password, :string

  # has_many :rentals
end
