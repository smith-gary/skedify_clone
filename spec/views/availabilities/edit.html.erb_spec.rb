require 'rails_helper'

RSpec.describe "availabilities/edit", type: :view do
  let(:availability) {
    Availability.create!(
      user: nil
    )
  }

  before(:each) do
    assign(:availability, availability)
  end

  it "renders the edit availability form" do
    render

    assert_select "form[action=?][method=?]", availability_path(availability), "post" do

      assert_select "input[name=?]", "availability[user_id]"
    end
  end
end
