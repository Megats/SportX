class ReceiptEventMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.receipt_event_mailer.post_created.subject
  #
  def post_created
    @participant = params[:participant]
    @event = params[:event]
    @category = params[:category]
    @greeting = "Hi"

    mail(
       from: "xbot5757@gmail.com",
       to: @participant.participant_email,
       subject: "testing"
    )
  end
end
