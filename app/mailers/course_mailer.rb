include Rails.application.routes.url_helpers

class CourseMailer < ApplicationMailer
  default from: "lernkurs@philosophie.ch"

  def welcome_mail(email)
    @email = email
    mail(to: email, bcc: "lernkurs@philosophie.ch", subject: 'Anmeldung erfolgreich - Lernkurs philosophie.ch')
  end

end
