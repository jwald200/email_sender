require 'net/smtp'
server_error = 'Please try again in a few minutes.'
SMTP_ERRORS = {
  IOError => "We encountered an internal issue. #{server_error}",
  Net::SMTPAuthenticationError => 'We got an authentication error.' ,
  Net::SMTPServerBusy => 'Email Server is busy.' ,
  Net::SMTPUnknownError => 'We encountered an internal issue.'
  Net::SMTPFatalError => 'The email address supplied is invalid.
    Please check for spelling mistakes.',
  Net::SMTPSyntaxError => 'The email address supplied is invalid.
    Please check for spelling mistakes.'
}

class EmailsController < ApplicationController
  def try_deliver(&block)
    begin
      yield
      {status: :success}
    rescue *SMTP_ERRORS.keys => error
      {status: :error, message: SMTP_ERRORS[error.class]}
    end
  end
  def new
  end

  def create
    email = params[:email]

    if !valid_email? params[:email]
      flash.now[:warning] = 'The email address supplied is invalid.'
      return render :new
    end

    status = try_deliver do
      VisitorMailer.welcome_email(email).deliver_now
    end

    case status[:status]
    when :success
      flash[:notice] = "A Welcome Email Has Been Sent to #{email}"
      redirect_to new_email_path
    when :error
      flash.now[:warning] = status[:message]
      render :new
    end
  end
end
