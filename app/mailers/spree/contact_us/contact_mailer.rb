class Spree::ContactUs::ContactMailer < Spree::BaseMailer
  def contact_email(contact)
    @contact = contact

    mail from: (SpreeContactUs.mailer_from || @contact.email),
         reply_to: @contact.email,
         subject: @contact.subject || Spree.t(:subject, email: @contact.email),
         to: SpreeContactUs.mailer_to || Spree::Store.current.customer_support_email
  end
end
