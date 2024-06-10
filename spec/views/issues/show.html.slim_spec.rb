require 'rails_helper'

RSpec.describe "issues/show", type: :view do
  before(:each) do
    assign(:issue, Issue.create!(
      magazine: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
