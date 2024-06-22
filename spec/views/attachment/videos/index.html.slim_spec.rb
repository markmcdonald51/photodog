require 'rails_helper'

RSpec.describe "attachment/videos/index", type: :view do
  before(:each) do
    assign(:attachment_videos, [
      Attachment::Video.create!(
        title: "Title",
        altitude: "9.99",
        latitude: "9.99",
        longitude: "9.99",
        image_views: 2,
        url: "Url",
        description: "MyText",
        device: nil
      ),
      Attachment::Video.create!(
        title: "Title",
        altitude: "9.99",
        latitude: "9.99",
        longitude: "9.99",
        image_views: 2,
        url: "Url",
        description: "MyText",
        device: nil
      )
    ])
  end

  it "renders a list of attachment/videos" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
