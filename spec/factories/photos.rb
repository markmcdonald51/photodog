FactoryBot.define do
  factory :photo do
    title { "MyString" }
    altitude { "9.99" }
    latitude { "9.99" }
    longitude { "9.99" }
    image_views { 1 }
    photo_taken_time { "2024-06-16 15:17:01" }
    url { "MyString" }
    description { "MyText" }
    device_type { "MyString" }
    user { nil }
  end
end
