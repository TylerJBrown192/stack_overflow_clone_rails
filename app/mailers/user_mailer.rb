class UserMailer < ApplicationMailer
  default from: "stackoverflowclone@epicodus.com"

  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Sign Up Confirmation"
  end

  def response_confirmation(user)
    @user = user
    mail to: user.email, subject: "You got a response to your question!"
  end
end
