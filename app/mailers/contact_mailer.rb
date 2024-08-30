class ContactMailer < ApplicationMailer
  default to: 'beth.codes1@gmail.com'

  def send_contact_email(name, title, email, message)
    @name = name
    @title = title
    @message = message
    @from_email = email

    mail(from: @from_email, subject: "New Contact Form Message: #{@title}")
  end
end
