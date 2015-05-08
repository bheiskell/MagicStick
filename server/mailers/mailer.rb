class Mailer < ActionMailer::Base
  default from: "magic-stick.herokuapp.com"

  def notification(to)
    mail(to: to, subject: "MagicStick notification") do |format|
      format.text
      format.html
    end
  end
end
