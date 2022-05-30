require 'test_helper'

class PostsTest < ApplicationSystemTestCase
  setup do
    admin_user = User.create!(
      email: 'test@example.com',
      password: 'password',
      confirmed_at: DateTime.now,
      approved: true
    )

    admin_user.add_role(:admin)

    @post = FactoryBot.create(:post_with_user)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  # test "should create post" do
  #   visit posts_url
  #   click_on "New post"
  #
  #   fill_in "Content", with: @post.content
  #   fill_in "Modified at", with: @post.modified_at
  #   check "Published" if @post.published
  #   fill_in "Published at", with: @post.published_at
  #   fill_in "Title", with: @post.title
  #   click_on "Create Post"
  #
  #   assert_text "Post was successfully created"
  #   click_on "Back"
  # end

  # test "should update Post" do
  #   visit post_url(@post)
  #   click_on "Edit this post", match: :first
  #
  #   fill_in "Content", with: @post.content
  #   fill_in "Modified at", with: @post.modified_at
  #   check "Published" if @post.published
  #   fill_in "Published at", with: @post.published_at
  #   fill_in "Title", with: @post.title
  #   click_on "Update Post"
  #
  #   assert_text "Post was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy Post" do
  #   visit post_url(@post)
  #   click_on "Destroy this post", match: :first
  #
  #   assert_text "Post was successfully destroyed"
  # end
end
