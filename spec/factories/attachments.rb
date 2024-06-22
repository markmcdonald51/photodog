FactoryBot.define do
  factory :attachment do
    title { "MyString" }
    altitude { "9.99" }
    latitude { "9.99" }
    longitude { "9.99" }
    image_views { 1 }
    photo_taken_time { "2024-06-22 16:30:01" }
    url { "MyString" }
    description { "MyText" }
    device { nil }
    user { nil }
    attachable { nil }
    type { "" }
  end
end
