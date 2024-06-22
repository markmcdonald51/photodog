require 'rails_helper'

RSpec.describe "attachments/show", type: :view do
  before(:each) do
    assign(:attachment, Attachment.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
  end
end
