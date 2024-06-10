require 'rails_helper'

RSpec.describe "magazines/edit", type: :view do
  let(:magazine) {
    Magazine.create!(
      name: "MyString",
      description: nil
    )
  }

  before(:each) do
    assign(:magazine, magazine)
  end

  it "renders the edit magazine form" do
    render

    assert_select "form[action=?][method=?]", magazine_path(magazine), "post" do

      assert_select "input[name=?]", "magazine[name]"

      assert_select "input[name=?]", "magazine[description]"
    end
  end
end
