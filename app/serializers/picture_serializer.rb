class PictureSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image, :user_id
end
