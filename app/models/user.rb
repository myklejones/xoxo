class User < ApplicationRecord
    has_many :matches
    has_many :matched_users, through: :matches, dependent: :destroy
   
    has_many :pictures
    has_many :messages


    has_many :convos_as_senders , foreign_key: :sender_id, class_name: 'Conversation', dependent: :destroy
    has_many :recipients , through: :convos_as_senders, source: :recipient
   
    has_many :convos_as_recipients , foreign_key: :recipient_id, class_name: 'Conversation', dependent: :destroy
    has_many :senders , through: :convos_as_recipients, source: :sender
   

    has_secure_password



    PASSWORD_FORMAT = /\A
        (?=.{6,})          
        (?=.*\d)          
        (?=.*[a-z])       
        (?=.*[A-Z])        
    /x

    validates :username, presence: true, length: { minimum: 2 }, uniqueness: true
    validates :email, presence: true, uniqueness: true
    # validates :password, presence: true, length: { in: 6..15 }, format: PASSWORD_FORMAT
    # validates :name, presence: true, length: { minimum: 2 }
    # validates :photo, presence: true
    # validates :age, presence: true, numericality: true
    # validates :dob, presence: true, format: { with: /\d{2}\/\d{2}\/\d{4}/ }
    # validates :city_state, presence: true
    # validates :about_me, presence: true, length: { maximum: 250 }
    # validates :sex, presence: true
    # validates :active, inclusion: { in: [true, false] }

end
