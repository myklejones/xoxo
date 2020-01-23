class ConversationsController < ApplicationController

  before_action do
  end

  def show
    convo_id = params[:id]
    convo = Conversation.find(convo_id)
    if convo.sender_id == user_id_from_token || convo.recipient_id == user_id_from_token 
      messages = Message.all.map{|m| m.conversaton_id == convo.id }
      render json: { ok:true, conversation: convo, messages: messages }
    else
      render json: {ok:true, conversation: convo.errors.full_messages}, status: :unprocessable_entity
    end

  end 



    def create
        if message_params[:user_id].to_i == user_id_from_token
          if Conversation.between(conversation_params[:sender_id],conversation_params[:recipient_id]).present?
            conversation =  Conversation.between(conversation_params[:sender_id],conversation_params[:recipient_id]).first
            @message= message_params
            @message[:conversation_id] = conversation.id\
            message = Message.create(@message)
            render json: {ok:true, conversation: conversation, message: message}
          else
           conversation = Conversation.create(conversation_params)
           @message= message_params
          @message[:conversation_id] = conversation.id
          message = Message.create(@message)
          render json: {ok:true, conversation: conversation, message: message}
          end
        else
            render json: {errors: conversation.errors.full_messages}, status: :unprocessable_entity
        end
      end
    
    
    private
 def conversation_params
  params.require(:conversation).permit(:sender_id, :recipient_id)
 end
 def message_params
    params.require(:message).permit(:user_id, :body, :read)
 end

end
