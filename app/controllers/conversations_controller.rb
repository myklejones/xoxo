class ConversationsController < ApplicationController


    def create
      
        if Conversation.between(params[:sender_id],params[:recipient_id]).present? && user_id_from_token == params[:sender_id].to_i
          conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
          message = Message.create(message_params)

          render json: {ok:true, conversation: Conversation}
        elsif user_id_from_token == params[:sender_id].to_i
          conversation = Conversation.create!(conversation_params)
          message = Message.new(message_params)
          render json: {ok:true, conversation: Conversation}
        else
            render json: {errors: conversation.errors.full_messages}, status: :unprocessable_entity
        end
       
      end
    
    
    private
 def conversation_params
  params.permit(:sender_id, :recipient_id)
 end
 def message_params
    params.permit(:user_id, :conversation_id, :body)
end

end
