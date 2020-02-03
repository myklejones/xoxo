class ConversationChannel < ApplicationCable::Channel
  def subscribed
    puts 'SUBSCRIBED' 
    stream_from "conversation_channel"
  end

  def unsubscribed
    puts 'UNSUBSCRIBED' 
  end
end
