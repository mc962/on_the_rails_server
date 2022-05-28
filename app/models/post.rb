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

# frozen_string_literal: true

# Represents a blog post that may be written by an author
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  validates :title, :published, :content, :author, presence: true

  # Only bother to change published_at if `published` field will change
  before_save :set_published_at, if: :will_save_change_to_published?
  # Always set modified_at before Post is saved, but only bother if Post has been published
  before_save :set_modified_at, if: :published?

  private

  # Set published_at timestamp to current DateTime (UTC) only when the Post is published for the first time,
  #   as Post should only ever be published once
  def set_published_at
    self.published_at = DateTime.now.utc unless published_at?
  end

  # Sets modified_at timestamp to current DateTime (UTC) whenever a change is made to the post to track the change.
  #
  # @note Only bother to set modified_at if Post is published, as there is no need to track changes for an un-published
  #   Post.
  def set_modified_at
    self.modified_at = DateTime.now.utc
  end
end
