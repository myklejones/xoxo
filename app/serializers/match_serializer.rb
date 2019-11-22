class MatchSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :matched_user_id ,:created_at
end
