class ConversationsController < ApplicationController
  before_action :require_login

  def index
    @conversations = Conversation.all
    @users = if params[:search]
      User.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      User.all
    end

  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  def update
    @conversation = Conversation.find(params[:id])
    if @conversation.update_attributes(conversation_params)
      redirect_back_or_to conversation_messages_path(@conversation)
    end
  end
  private
  def conversation_params
    params.require(:conversation).permit(:sender_id, :recipient_id, :subject)
  end
end
