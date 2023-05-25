# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostMailer, type: :mailer do
  describe '#created_mail' do
    let(:post) { mock_model Post, author: 'test@email.com', title: 'title', body: 'somebody' }
    let(:mail) { described_class.with(post:).created_mail.deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq('Post was created successfully')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([post.author])
    end

    it 'assigns @post' do
      expect(mail.body.encoded).to match(post.title)
    end
  end
end
