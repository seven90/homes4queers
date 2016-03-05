class ConversationsController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    recipients = User.where(id: conversation_params[:recipients])
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject])
  end

end
