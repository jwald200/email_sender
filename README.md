##Description

This app accepts an email address, checks if it is a valid address and sends a message to that address. If there are errors, the user will see a flash message with the error.

##Setup

- `git clone https://github.com/jwald200/email_sender`
- `bundle install`
- `bundle exec figaro install`

- Write the following in config/application.yml
```
gmail_username: your username
gmail_password: your password
```

- Go to [settings](https://myaccount.google.com/lesssecureapps) and allow less secure apps (you can turn it off after testing)
