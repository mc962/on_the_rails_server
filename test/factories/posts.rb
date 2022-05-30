# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  content      :text             not null
#  published_at :date
#  modified_at  :date
#  published    :boolean          default("false"), not null
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_posts_on_title    (title) UNIQUE
#  index_posts_on_user_id  (user_id)
#

FactoryBot.define do
  factory :post do
    title { Faker::Book.unique.title }
    content { Faker::Lorem.paragraphs(number: 3) }
    published_at { Faker::Date.forward(days: 1) }
    modified_at { Faker::Date.forward(days: 23) }
    published { true }

    factory :post_with_user do
      after(:build) do |post|
        user = FactoryBot.create(:user)
        post.author = user
      end
    end
  end
end
