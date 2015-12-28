class NotificationMailer < ApplicationMailer
  default from: 'admisionpostgrado.artes@u.uchile.cl'
  
  def notification_postulation(postulation)
    @postulation = postulation
    @postulation.email.delete(' ')
    mail(to: @postulation.email, subject: "test")
  end
end
