require 'net/smtp'
SMTP_CLIENT_ERROR_MESSAGE = 'The email address supplied is invalid. Please check for spelling mistakes.'

SMTP_ERRORS = {
  IOError => "We encountered an internal issue.",
  Net::SMTPAuthenticationError => 'We got an authentication error.' ,
  Net::SMTPServerBusy => 'Email Server is busy.' ,
  Net::SMTPUnknownError => 'We encountered an internal issue.',
  Net::SMTPFatalError => SMTP_CLIENT_ERROR_MESSAGE,
  Net::SMTPSyntaxError => SMTP_CLIENT_ERROR_MESSAGE
}
