require 'rails_helper'

RSpec.describe "issues/edit", type: :view do
  let(:issue) {
    Issue.create!(
      magazine: nil
    )
  }

  before(:each) do
    assign(:issue, issue)
  end

  it "renders the edit issue form" do
    render

    assert_select "form[action=?][method=?]", issue_path(issue), "post" do

      assert_select "input[name=?]", "issue[magazine_id]"
    end
  end
end
