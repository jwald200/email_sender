RSpec.feature 'email form' do
  scenario 'user enters invalid email' do
    visit new_email_path
    fill_in 'email', with: '@go.com'
    click_on 'Send Me an Email'

    expect(page).to have_css('.warning', text: SMTP_CLIENT_ERROR_MESSAGE)
  end

  scenario 'user enters valid email' do
    expect(VisitorMailer).to receive(:welcome_email).with('hello@go.com')
    visit new_email_path
    fill_in 'email', with: 'hello@go.com'
    click_on 'Send Me an Email'

    expect(page).to have_css('.notice', text: "A Welcome Email Has Been Sent to hello@go.com")
  end
end
