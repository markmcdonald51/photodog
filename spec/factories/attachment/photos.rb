FactoryBot.define do
  factory :attachment_photo, class: 'Attachment::Photo' do
    title { "MyString" }
    altitude { "9.99" }
    latitude { "9.99" }
    longitude { "9.99" }
    image_views { 1 }
    photo_taken_time { "2024-06-22 16:36:41" }
    url { "MyString" }
    description { "MyText" }
    device { nil }
  end
end
