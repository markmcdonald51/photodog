require 'rails_helper'

RSpec.describe "magazines/show", type: :view do
  before(:each) do
    assign(:magazine, Magazine.create!(
      name: "Name",
      description: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
