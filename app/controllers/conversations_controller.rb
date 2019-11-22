class ConversationsController < ApplicationController


    
    private
 def conversation_params
  params.permit(:sender_id, :recipient_id)
 end

end
