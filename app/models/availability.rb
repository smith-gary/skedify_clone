class Availability < ApplicationRecord
  belongs_to :user
  validates :start_time, :end_time, presence: true
  has_one :booking, dependent: :destroy
end
