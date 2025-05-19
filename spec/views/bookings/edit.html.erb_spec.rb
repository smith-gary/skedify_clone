require 'rails_helper'

RSpec.describe "bookings/edit", type: :view do
  let(:booking) {
    Booking.create!(
      availability: nil,
      client_email: "MyString",
      status: "MyString"
    )
  }

  before(:each) do
    assign(:booking, booking)
  end

  it "renders the edit booking form" do
    render

    assert_select "form[action=?][method=?]", booking_path(booking), "post" do

      assert_select "input[name=?]", "booking[availability_id]"

      assert_select "input[name=?]", "booking[client_email]"

      assert_select "input[name=?]", "booking[status]"
    end
  end
end
