class Like < ActiveRecord::Base
    belongs_to :user
    belongs_to :face
    
    validates_uniqueness_of :user, scope: :face
end