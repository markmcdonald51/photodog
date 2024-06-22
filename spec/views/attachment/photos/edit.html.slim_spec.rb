require 'rails_helper'

RSpec.describe "attachment/photos/edit", type: :view do
  let(:attachment_photo) {
    Attachment::Photo.create!(
      title: "MyString",
      altitude: "9.99",
      latitude: "9.99",
      longitude: "9.99",
      image_views: 1,
      url: "MyString",
      description: "MyText",
      device: nil
    )
  }

  before(:each) do
    assign(:attachment_photo, attachment_photo)
  end

  it "renders the edit attachment_photo form" do
    render

    assert_select "form[action=?][method=?]", attachment_photo_path(attachment_photo), "post" do

      assert_select "input[name=?]", "attachment_photo[title]"

      assert_select "input[name=?]", "attachment_photo[altitude]"

      assert_select "input[name=?]", "attachment_photo[latitude]"

      assert_select "input[name=?]", "attachment_photo[longitude]"

      assert_select "input[name=?]", "attachment_photo[image_views]"

      assert_select "input[name=?]", "attachment_photo[url]"

      assert_select "textarea[name=?]", "attachment_photo[description]"

      assert_select "input[name=?]", "attachment_photo[device_id]"
    end
  end
end
