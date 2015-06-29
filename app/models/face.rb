class Face < ActiveRecord::Base 
    belongs_to :user
    validates :user_id, presence:true
    validates :picture, presence: true, length: { minimum: 4, maximum: 100 }
    validates :description, presence: true, length: { minimum: 4, maximum: 120 }
    
end