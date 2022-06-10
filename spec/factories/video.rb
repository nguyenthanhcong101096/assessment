FactoryBot.define do
  factory :video do
    video_url { Faker::Internet.url }
    video_id { Faker::Number.number }
    video_title { Faker::Lorem.sentence }
    video_description { Faker::Lorem.paragraphs(number: 10) }
  end
end
