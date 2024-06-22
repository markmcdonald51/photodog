require 'rails_helper'

RSpec.describe "attachment/photos/new", type: :view do
  before(:each) do
    assign(:attachment_photo, Attachment::Photo.new(
      title: "MyString",
      altitude: "9.99",
      latitude: "9.99",
      longitude: "9.99",
      image_views: 1,
      url: "MyString",
      description: "MyText",
      device: nil
    ))
  end

  it "renders new attachment_photo form" do
    render

    assert_select "form[action=?][method=?]", attachment_photos_path, "post" do

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
