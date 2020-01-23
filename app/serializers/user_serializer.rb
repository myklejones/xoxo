class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :email, :name, :photo, :age, :dob, :city_state, :about_me , :sex, :active, :interest, :preference, :body_type, :profession, :convos_as_senders, :convos_as_recipients, :messages, :pictures, :created_at, :updated_at
end
