require 'rails_helper'

RSpec.describe "bookings/index", type: :view do
  before(:each) do
    assign(:bookings, [
      Booking.create!(
        availability: nil,
        client_email: "Client Email",
        status: "Status"
      ),
      Booking.create!(
        availability: nil,
        client_email: "Client Email",
        status: "Status"
      )
    ])
  end

  it "renders a list of bookings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Client Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
  end
end
