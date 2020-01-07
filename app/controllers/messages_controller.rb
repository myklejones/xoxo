class MessagesController < ApplicationController
    before_action do
        @conversation = Conversation.find(params[:conversation_id])
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
        private
        def message_params
            params.permit(:message, :read, :reciever_id, :sender_id)
        end
end
