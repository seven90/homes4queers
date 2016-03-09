class MessageMailer < ApplicationMailer
  default from: 'homes4queers@gmail.com'
  layout 'mailer'

  def message_notification(user)
    #@user = User.find(@conversation.recipient_id), set in messages_controller
    @user= user
    # @url = 'homes4queers'
    mail(to: @user.email, subject: "You have a new message")
  end
end
