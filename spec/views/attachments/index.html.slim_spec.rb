require 'rails_helper'

RSpec.describe "attachments/index", type: :view do
  before(:each) do
    assign(:attachments, [
      Attachment.create!(
        title: "Title",
        altitude: "9.99",
        latitude: "9.99",
        longitude: "9.99",
        image_views: 2,
        url: "Url",
        description: "MyText",
        device: nil,
        user: nil,
        attachable: nil,
        type: "Type"
      ),
      Attachment.create!(
        title: "Title",
        altitude: "9.99",
        latitude: "9.99",
        longitude: "9.99",
        image_views: 2,
        url: "Url",
        description: "MyText",
        device: nil,
        user: nil,
        attachable: nil,
        type: "Type"
      )
    ])
  end

  it "renders a list of attachments" do
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
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Type".to_s), count: 2
  end
end
