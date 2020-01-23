class ConversationsController < ApplicationController

  before_action do
    
  end

  def index
   
    if user_id_from_token 
      conversations = Conversation.all.each{|c| c.sender_id == user_id_from_token || c.recipient_id == user_id_from_token}
      messages = Message.all.each{|m| conversations.map{|c| m.conversation_id == c.id}}
      render json:{ok:true, conversations: conversations, messages: messages }

    else
      render json:{ ok: true, conversation:conversations.errors.full_messages , messages: messages.errors.full_messages}
    end

  end 

  def show
    convo_id = params[:id]
    convo = Conversation.find(convo_id)
    if convo.sender_id == user_id_from_token || convo.recipient_id == user_id_from_token 
      messages = Message.all.each{|m| m.conversaton_id == convo.id }
      render json: { ok:true, conversation: convo, messages: messages }
    else
      render json: {ok:true, conversation: convo.errors.full_messages}, status: :unprocessable_entity
    end

  end 



    def create
        if message_params[:user_id].to_i == user_id_from_token
          if Conversation.between(conversation_params[:sender_id],conversation_params[:recipient_id]).present?
            conversation =  Conversation.between(conversation_params[:sender_id],conversation_params[:recipient_id]).first
            message = conversation.messages.create(message_params)
            render json: {ok:true, conversation: conversation, message: message}
          else
            conversation = Conversation.create(conversation_params)
            message = conversation.messages.create(message_params)
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
