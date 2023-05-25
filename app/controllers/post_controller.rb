# frozen_string_literal: true

class PostController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    post = Post.new(post_params)
    if post.valid?
      post.save
      render json: post
    else
      render json: { errors: post.errors.full_messages }
    end
  end

  private

  def post_params
    params.require(:post).permit(:author, :title, :body)
  end
end
