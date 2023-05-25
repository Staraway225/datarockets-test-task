# frozen_string_literal: true

class PostMailer < ApplicationMailer
  def created_mail
    @post = params[:post]
    mail(to: @post.author, subject: 'Post was created successfully')
  end
end
