class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <yerlan.madiyarov@yandex.ru>}
  layout 'mailer'
end
