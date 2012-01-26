class TestMailer < ActionMailer::Base
  default from: "from@example.com"

  def hello(email)
    mail(to: email)
  end

end
