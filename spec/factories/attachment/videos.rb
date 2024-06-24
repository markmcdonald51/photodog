FactoryBot.define do
  factory :attachment_video, class: 'Attachment::Video' do
    title { "MyString" }
    altitude { "9.99" }
    latitude { "9.99" }
    longitude { "9.99" }
    image_views { 1 }
    photo_taken_time { "2024-06-22 16:40:26" }
    url { "MyString" }
    description { "MyText" }
    device { nil }
  end
end
