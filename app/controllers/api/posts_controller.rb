# frozen_string_literal: true

class API::PostsController < API::ApplicationController
  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    @post = Post.find(params[:id])

    render json: @post
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      render json: @post, status: :ok, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    head :no_content
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(
      :title,
      :content,
      :published_at,
      :modified_at,
      :published
    )
  end
end
