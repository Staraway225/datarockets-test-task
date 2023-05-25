# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview
  def created_mail
    PostMailer.with(post: Post.last).created_mail
  end
end
