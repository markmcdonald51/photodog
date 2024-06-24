require 'rails_helper'

RSpec.describe "attachments/edit", type: :view do
  let(:attachment) {
    Attachment.create!(
      title: "MyString",
      altitude: "9.99",
      latitude: "9.99",
      longitude: "9.99",
      image_views: 1,
      url: "MyString",
      description: "MyText",
      device: nil,
      user: nil,
      attachable: nil,
      type: ""
    )
  }

  before(:each) do
    assign(:attachment, attachment)
  end

  it "renders the edit attachment form" do
    render

    assert_select "form[action=?][method=?]", attachment_path(attachment), "post" do

      assert_select "input[name=?]", "attachment[title]"

      assert_select "input[name=?]", "attachment[altitude]"

      assert_select "input[name=?]", "attachment[latitude]"

      assert_select "input[name=?]", "attachment[longitude]"

      assert_select "input[name=?]", "attachment[image_views]"

      assert_select "input[name=?]", "attachment[url]"

      assert_select "textarea[name=?]", "attachment[description]"

      assert_select "input[name=?]", "attachment[device_id]"

      assert_select "input[name=?]", "attachment[user_id]"

      assert_select "input[name=?]", "attachment[attachable_id]"

      assert_select "input[name=?]", "attachment[type]"
    end
  end
end
