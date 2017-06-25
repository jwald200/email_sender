require "rails_helper"

RSpec.describe VisitorMailer, type: :mailer do
  let(:email) { VisitorMailer.welcome_email('hello@example.com').deliver_now }
  it 'sends a welcome email to the email given.' do
    expect(email.to).to include('hello@example.com')
  end

  it 'has a correct subject' do
    expect(email.subject).to eq('Welcome from email sender.')
  end
end
