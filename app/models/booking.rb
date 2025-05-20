class Booking < ApplicationRecord
  belongs_to :availability
  validates :client_email, presence: true
end
