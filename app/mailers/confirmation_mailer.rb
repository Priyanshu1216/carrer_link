class ConfirmationMailer < ApplicationMailer
  default from: 'xoxocherry011@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://127.0.0.1:3000'
    mail(to: @user.email, subject: 'Welcome to CarrerLink!')
  end

  def application_email
    @user = params[:user]
    @job = params[:job]
    mail(to: @user.profile.email, subject: 'Application recieved')
  end

end
