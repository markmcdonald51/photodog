require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      issue: nil,
      title: "MyString",
      tagline: "MyText",
      author: nil,
      position: 1
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input[name=?]", "article[issue_id]"

      assert_select "input[name=?]", "article[title]"

      assert_select "textarea[name=?]", "article[tagline]"

      assert_select "input[name=?]", "article[author_id]"

      assert_select "input[name=?]", "article[position]"
    end
  end
end
