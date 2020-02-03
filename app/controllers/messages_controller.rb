class MessagesController < ApplicationController
    before_action do
      
      end

     
        def create
        
        user_id = params[:message_sender_id]
        messageCreated = Message.create(message_params)
    
    
    
            if user_id_from_token == user_id.to_i
            render json: {ok:true, message: messageCreated}
            else
            render json: {errors: messageCreated.errors.full_messages}, status: :unprocessable_entity
            end  
        end

    def destroy
        user_id = User.find(user_id_from_token)
        message = Message.find(params[:id])
        conversations = user_id.convos_as_senders + user_id.convos_as_recipients
        conversations = ConversationSerializer.new(conversations)
        convo = Conversation.find(message.conversation_id)
        convo = ConversationSerializer.new(convo)
        if user_id_from_token == user_id.id
        message.destroy 
        render json: {message: "destroyed", activeConvo: convo , conversations: conversations}
        end
    end 

    private
     
end
