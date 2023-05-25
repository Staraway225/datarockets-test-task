# frozen_string_literal: true

class Post < ApplicationRecord
  validates :author, :title, :body, presence: true
  after_save :create_history_record_and_send_mail

  private

  def create_history_record_and_send_mail
    History.create!(user: author, type: 'create')
    PostMailer.with(post: self).created_mail.deliver_later
  end
end
