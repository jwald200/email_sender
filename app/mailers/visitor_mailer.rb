class VisitorMailer < ApplicationMailer
  def welcome_email(email_address)
    @email_address = email_address

    mail to: email_address,
      subject: 'Welcome from email sender.'
  end
end
