class ApplicationMailer < ActionMailer::Base
  default from: 'everybody@appacademy.io'
  
  def welcome_email(user)
    @user = user
    @url = 'localhost:3000/session/new'
    mail(to: user.email, subject: 'Welcome to my site!')
  end 
  layout 'mailer'
end
