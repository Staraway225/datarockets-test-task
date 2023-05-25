# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe '#create' do
    let(:params) do
      {
        post: { author: 'example@example.com', title: 'some post', body: 'somebody' }
      }
    end

    let(:create_post) { post '/post', params: }

    it 'creates a post' do
      expect { create_post }.to change(Post, :count).by(1)
    end

    it 'returns post as a JSON on success' do
      create_post

      expect(response.body).to eq(Post.last.to_json)
    end

    it 'returns an error response on error' do
      invalid_params = {
        post: { author: nil, title: nil, body: nil }
      }

      post '/post', params: invalid_params

      expect(response.body).to match(/can't be blank/)
    end
  end
end
