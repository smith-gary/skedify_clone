require 'rails_helper'

RSpec.describe "availabilities/new", type: :view do
  before(:each) do
    assign(:availability, Availability.new(
      user: nil
    ))
  end

  it "renders new availability form" do
    render

    assert_select "form[action=?][method=?]", availabilities_path, "post" do

      assert_select "input[name=?]", "availability[user_id]"
    end
  end
end
