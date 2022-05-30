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

require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
