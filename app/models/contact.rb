class Contact < ActiveRecord::Base
    belongs_to :contact
    validates :firstname, presence: true, length: { minimum: 2, maximum: 15 }
    VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 },
                                        uniqueness: { case_sensitive: false },
                                        format: { with: VALID_EMAIL_REGEX }
    validates :subject, presence: true
    validates :contact, presence: true, length: { minimum: 2, maximum: 400 }

end
