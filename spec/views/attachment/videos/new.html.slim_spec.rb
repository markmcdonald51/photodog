require 'rails_helper'

RSpec.describe "attachment/videos/new", type: :view do
  before(:each) do
    assign(:attachment_video, Attachment::Video.new(
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

  it "renders new attachment_video form" do
    render

    assert_select "form[action=?][method=?]", attachment_videos_path, "post" do

      assert_select "input[name=?]", "attachment_video[title]"

      assert_select "input[name=?]", "attachment_video[altitude]"

      assert_select "input[name=?]", "attachment_video[latitude]"

      assert_select "input[name=?]", "attachment_video[longitude]"

      assert_select "input[name=?]", "attachment_video[image_views]"

      assert_select "input[name=?]", "attachment_video[url]"

      assert_select "textarea[name=?]", "attachment_video[description]"

      assert_select "input[name=?]", "attachment_video[device_id]"
    end
  end
end
