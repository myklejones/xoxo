class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :body, :read, :user_id, :conversation_id, :message_recviever_id, :created_at
end
