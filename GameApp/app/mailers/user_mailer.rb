class UserMailer < ActionMailer::Base
  default from: "julien@deslangles.com"



  def registration_confirmation(user)
    @user = user
    attachments["Logo.png"] = File.read("#{Rails.root}/app/assets/images/Logo.png")
    mail(to: user.email, subject: "Successfully registered - Welcome to G.A.MES!")
  end




end
