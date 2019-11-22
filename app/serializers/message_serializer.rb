class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :body, :read, :user_id, :conversation_id, :created_at
end
