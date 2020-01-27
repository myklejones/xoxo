class ConversationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :sender_id , :recipient_id, :messages
end
