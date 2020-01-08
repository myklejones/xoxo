class Message < ApplicationRecord
    belongs_to :conversation
    belongs_to :user
    belongs_to :message_reciever, class_name: "User"

    validates :body, presence: true, length: { maximum: 250 }
end
