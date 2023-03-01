#include Rails.application.routes.url_helpers

class CourseMailer < ApplicationMailer
  default from: "info@philosophie.ch"

  def welcome_mail(email, account)
    @email = email
    @account = account
    mail(to: email, bcc: "s.raess@me.com", subject: 'Anmeldung erfolgreich - Lernkurs philosophie.ch')
  end

end
