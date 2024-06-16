require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before(:each) do
    assign(:photo, Photo.new(
      title: "MyString",
      altitude: "9.99",
      latitude: "9.99",
      longitude: "9.99",
      image_views: 1,
      url: "MyString",
      description: "MyText",
      device_type: "MyString",
      user: nil
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input[name=?]", "photo[title]"

      assert_select "input[name=?]", "photo[altitude]"

      assert_select "input[name=?]", "photo[latitude]"

      assert_select "input[name=?]", "photo[longitude]"

      assert_select "input[name=?]", "photo[image_views]"

      assert_select "input[name=?]", "photo[url]"

      assert_select "textarea[name=?]", "photo[description]"

      assert_select "input[name=?]", "photo[device_type]"

      assert_select "input[name=?]", "photo[user_id]"
    end
  end
end
