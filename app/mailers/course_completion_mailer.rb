class CourseCompletionMailer < ApplicationMailer
  default from: "info@philosophie.ch"

  def send_results_to_email(account_id, course_id, email1, email2)
    @account = Account.find(account_id)
    @course = Course.find(course_id)
    mail(to: email1, cc: email2, subject: 'Kurs abgeschlossen -  - Lernkurs philosophie.ch')
  end

end
