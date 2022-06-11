# Preview all emails at http://localhost:3000/rails/mailers/support_requests_mailer
class SupportRequestsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/support_requests_mailer/respond
  def respond
    SupportRequestsMailer.respond
  end

end
