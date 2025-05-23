require 'rails_helper'

RSpec.describe "availabilities/index", type: :view do
  before(:each) do
    assign(:availabilities, [
      Availability.create!(
        user: nil
      ),
      Availability.create!(
        user: nil
      )
    ])
  end

  it "renders a list of availabilities" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
