require "test_helper"

class PostsControllerTest < ApplicationControllerTestCase
  setup do
    @post = FactoryBot.create(:post_with_user)
    @user = @post.author
    sign_in @user
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post_attributes = FactoryBot.build(:post).attributes
      post posts_url, params: { post: { **post_attributes, content: Faker::Lorem.paragraphs(number: 3).join('\\n') } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { content: @post.content, modified_at: @post.modified_at, published: @post.published, published_at: @post.published_at, title: @post.title } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
