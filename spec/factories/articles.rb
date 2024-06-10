FactoryBot.define do
  factory :article do
    issue { nil }
    title { "MyString" }
    tagline { "MyText" }
    author { nil }
    position { 1 }
  end
end
