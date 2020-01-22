class ConversationsController < ApplicationController

  before_action do
    if Conversation.between(conversation_params[:sender_id],conversation_params[:recipient_id]).present?
      @conversation =  Conversation.between(conversation_params[:sender_id],conversation_params[:recipient_id]).first
      @message= message_params
      @message[:conversation_id] = @conversation.id
    else
     @conversation = Conversation.create(conversation_params)
     @message= message_params
    @message[:conversation_id] = @conversation.id
    end
  end

  def index
    messages = Message.all.map{|m| m.conversation_id == @conversation.id}
    render json:{ok:true, conversation: @conversation, messages: messages}
  end

    def create
        if message_params[:user_id].to_i == user_id_from_token
          message = Message.create(@message)
          render json: {ok:true, conversation: @conversation, message: message}
        else
            render json: {errors: conversation.errors.full_messages}, status: :unprocessable_entity
        end
      end
    
    
    private
 def conversation_params
  params.require(:conversation).permit(:sender_id, :recipient_id)
 end
 def message_params
    params.require(:message).permit(:user_id, :body, :read, :message_reciever_id)
 end

end
