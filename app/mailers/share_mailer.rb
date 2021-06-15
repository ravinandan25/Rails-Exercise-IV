class ShareMailer < ApplicationMailer
  default from: 'ravinandan.bhardwaj@gmail.com'

  def share_blog
    @s_email = params[:sender]
    @url = params[:url]
    mail(to: params[:input_email].to_s, subject: 'have a look at this blog')
  end
end
