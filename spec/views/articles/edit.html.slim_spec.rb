require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  let(:article) {
    Article.create!(
      issue: nil,
      title: "MyString",
      tagline: "MyText",
      author: nil,
      position: 1
    )
  }

  before(:each) do
    assign(:article, article)
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(article), "post" do

      assert_select "input[name=?]", "article[issue_id]"

      assert_select "input[name=?]", "article[title]"

      assert_select "textarea[name=?]", "article[tagline]"

      assert_select "input[name=?]", "article[author_id]"

      assert_select "input[name=?]", "article[position]"
    end
  end
end
