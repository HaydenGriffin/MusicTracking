class ApplicationMailer < ActionMailer::Base
  default to: "hg00260@surrey.ac.uk", from: 'test@email.com'
  layout 'mailer'
end
