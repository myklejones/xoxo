class User < ApplicationRecord
    has_many :matches
    has_many :matched_users, through: :matches, dependent: :destroy
   


    
    has_many :pictures
    has_many :messages
    has_many :message_recievers, through: :messages
    has_many :conversations, :foreign_key => :sender_id
   

    has_secure_password



    PASSWORD_FORMAT = /\A
        (?=.{6,})          
        (?=.*\d)          
        (?=.*[a-z])       
        (?=.*[A-Z])        
    /x


    validates :username, presence: true, length: { minimum: 2 }, uniqueness: true
    # validates :password, presence: true, length: { in: 6..15 }, format: PASSWORD_FORMAT
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true, length: { minimum: 2 }
    validates :photo, presence: true
    validates :age, presence: true, numericality: true
    validates :dob, presence: true, format: { with: /\d{2}\/\d{2}\/\d{4}/ }
    validates :city_state, presence: true
    validates :about_me, presence: true, length: { maximum: 250 }
    validates :sex, presence: true
    validates :active, inclusion: { in: [true, false] }
end
