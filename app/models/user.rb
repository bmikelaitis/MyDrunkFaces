class User < ActiveRecord::Base 
    has_many :faces
    before_save { self.email = email.downcase }
    validates :firstname, presence: true, length: { minimum: 2, maximum: 15 }
    validates :lastname, presence: true, length: { minimum: 2, maximum: 20 }
    VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 },
                                        uniqueness: { case_sensitive: false },
                                        format: { with: VALID_EMAIL_REGEX }

    
end