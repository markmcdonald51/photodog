require 'rails_helper'

RSpec.describe "photos/edit", type: :view do
  let(:photo) {
    Photo.create!(
      title: "MyString",
      latitude: "9.99",
      longitude: "9.99",
      image_views: 1,
      url: "MyString",
      description: "MyText",
      device_type: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:photo, photo)
  end

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(photo), "post" do

      assert_select "input[name=?]", "photo[title]"

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
