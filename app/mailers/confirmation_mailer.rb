class ConfirmationMailer < ApplicationMailer
  default from: 'xoxocherry011@gmail.com'
  before_action :setup_application, only: [:accept_application,:reject_application,:application_email]

  def welcome_email(user)
    @user = user
    @url  = 'http://127.0.0.1:3000'
    mail(to: @user.email, subject: 'Welcome to CarrerLink!')
  end

  def application_email
    mail(to: @user.profile.email, subject: 'Application recieved')
  end

  def accept_application
    mail(to: @user.profile.email, subject: 'Application accepted')
  end

  def reject_application
    mail(to: @user.profile.email, subject: 'Application rejected')
  end

  private

  def setup_application
    @user = params[:user]
    @job = params[:job]
  end

end
