FactoryBot.define do
  factory :post do
    title { Faker::Book.unique.title }
    content { Faker::Lorem.paragraphs(number: 3) }
    published_at { Faker::Date.forward(days: 1) }
    modified_at { Faker::Date.forward(days: 23) }
    published { true }
  end
end
