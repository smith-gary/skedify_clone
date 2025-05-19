require 'rails_helper'

RSpec.describe "bookings/new", type: :view do
  before(:each) do
    assign(:booking, Booking.new(
      availability: nil,
      client_email: "MyString",
      status: "MyString"
    ))
  end

  it "renders new booking form" do
    render

    assert_select "form[action=?][method=?]", bookings_path, "post" do

      assert_select "input[name=?]", "booking[availability_id]"

      assert_select "input[name=?]", "booking[client_email]"

      assert_select "input[name=?]", "booking[status]"
    end
  end
end
