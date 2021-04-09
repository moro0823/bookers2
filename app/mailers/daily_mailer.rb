class DailyMailer < ApplicationMailer
  def notify_daily
    default to: -> { User.pluck(:email) }
    mail(subject: "everyday Bookers!yay!")
  end
end
