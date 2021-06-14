class FeedbackMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def feedback_email(opts)
    @title = opts[:title]
    @body = opts[:text]
    @user = params[:user]

    mail(subject: "Feedback from: #{@user.email}")
  end
end
