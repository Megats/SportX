# Preview all emails at http://localhost:3000/rails/mailers/receipt_event_mailer
class ReceiptEventMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/receipt_event_mailer/post_created
  def post_created
    ReceiptEventMailer.post_created
  end

end
