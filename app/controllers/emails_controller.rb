class EmailsController < ApplicationController
  def new
  end

  def create
    email = params[:email]

    if email.blank?
      flash.now[:warning] = "Email field can't be blank."
      return render :new
    elsif !valid_email? email
      flash.now[:warning] = SMTP_CLIENT_ERROR_MESSAGE
      return render :new
    end

    begin
      VisitorMailer.welcome_email(email)&.deliver_now
      flash[:notice] = "A Welcome Email Has Been Sent to #{email}"
      redirect_to new_email_path
    rescue *SMTP_ERRORS.keys => error
      flash.now[:warning] = SMTP_ERRORS[error.class]
      render :new
    end
  end
end
