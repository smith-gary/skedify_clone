require 'rails_helper'

RSpec.describe "availabilities/show", type: :view do
  before(:each) do
    assign(:availability, Availability.create!(
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
