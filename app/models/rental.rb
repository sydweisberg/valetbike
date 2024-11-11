class Rental < ApplicationRecord
  validates_presence_of    :identifier
  validates_uniqueness_of  :identifier
  attribute :start_time, :datetime
  attribute :end_time, :datetime
  attribute :over_time, :boolean
  attribute :duration, :integer

  belongs_to :user
  has_one :bike
end
