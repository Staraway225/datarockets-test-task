# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:params) do
    { author: 'somebody@example.com', title: 'some title', body: 'some text' }
  end

  context 'after save' do
    it 'creates a history record' do
      expect { Post.create(params) }.to change(History, :count).by(1)
    end

    it 'fills user field in history record with post author' do
      post = Post.create(params)
      history_record = History.last
      expect(post.author).to eq(history_record.user)
    end

    it 'sends created_mail' do
      post = Post.new(params)
      expect { post.save }.to have_enqueued_job.on_queue('default').exactly(:once)
    end
  end
end
