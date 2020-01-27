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
        
        message = Message.find(params[:id])
        message.destroy 
        render json: {message: "destroyed"}
    end 

    private
     
end
