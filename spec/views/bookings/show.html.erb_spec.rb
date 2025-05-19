require 'rails_helper'

RSpec.describe "bookings/show", type: :view do
  before(:each) do
    assign(:booking, Booking.create!(
      availability: nil,
      client_email: "Client Email",
      status: "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Client Email/)
    expect(rendered).to match(/Status/)
  end
end
