# frozen_string_literal: true

class API::PostsController < API::ApplicationController
  def index
    @posts = Post.published.order(:title).page(params[:page])

    render json: {
      data: @posts.map do |post|
        {
          title: post.title,
          published_at: post.published_at,
          modified_at: post.modified_at,
          _link: api_post_url(post)
        }
      end,
      navigation: {
        prev: (api_posts_url(page: @posts.prev_page) if @posts.prev_page),
        current: api_posts_url(page: @posts.current_page),
        next: (api_posts_url(page: @posts.next_page) if @posts.next_page),
      },
      pagination: {
        current: @posts.current_page,
        previous: @posts.prev_page,
        next: @posts.next_page,
        per_page: @posts.limit_value,
        pages: @posts.total_pages,
        count: @posts.total_count
      }
    }
  end

  def show
    @post = Post.find(params[:id])

    render json: {
      data: {
        **@post.attributes
      },
      navigation: {
        posts: api_posts_url
      }
    }
  end
end
