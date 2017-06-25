class EmailsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    if valid_email? params[:email]
      VisitorMailer.welcome_email(email)&.deliver_now
      flash[:notice] = "A Welcome Email Has Been Sent to #{email}"
      redirect_to new_email_path
    elsif email.blank?
      flash[:error] = 'Email field can\'t be blank.'

      render :new
    else
      flash[:error] = "#{email} is not a valid email address"

      render :new
    end
  end
end
