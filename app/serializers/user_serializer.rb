class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :email, :name, :photo, :age, :dob, :city_state, :about_me , :sex, :active, :conversation, :message, :picture, :created_at
end
