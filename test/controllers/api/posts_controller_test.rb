require "test_helper"

class API::PostsControllerTest < ApplicationControllerTestCase
  setup do
    @post = FactoryBot.create(:post_with_user)
    @user = @post.author
    sign_in @user
  end

  test "should get index" do
    get api_posts_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post_attributes = FactoryBot.build(:post).attributes
      post api_posts_url, params: { post: post_attributes }
    end

    assert_response :success
  end

  test "should show post" do
    get api_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch api_post_url(@post), params: { post: { content: @post.content, modified_at: @post.modified_at, published: @post.published, published_at: @post.published_at, title: @post.title } }
    assert_response :success
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete api_post_url(@post)
    end

    assert_response :no_content
  end
end
