require 'rails_helper'

RSpec.describe "magazines/index", type: :view do
  before(:each) do
    assign(:magazines, [
      Magazine.create!(
        name: "Name",
        description: nil
      ),
      Magazine.create!(
        name: "Name",
        description: nil
      )
    ])
  end

  it "renders a list of magazines" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
