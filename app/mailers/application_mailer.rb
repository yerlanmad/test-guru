class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <#{ENV.fetch('MAILER_SENDER')}>}
  layout 'mailer'
end
