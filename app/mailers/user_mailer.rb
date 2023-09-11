class UserMailer < ApplicationMailer
  default from: 'ramkrishnak@shriffle.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Job Portal')
  end
end
