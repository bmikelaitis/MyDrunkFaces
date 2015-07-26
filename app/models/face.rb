class Face < ActiveRecord::Base 
    belongs_to :user
    has_many :likes
    validates :user_id, presence:true
    validates :description, presence: true, length: { minimum: 4, maximum: 120 }
    mount_uploader :picture, PictureUploader
    validates :picture, presence:true
    validate :picture_size
    default_scope -> { order(updated_at: :desc)}
    
    def thumbs_up_total
        self.likes.where(like: true).size
    end
    
    def thumbs_down_total
        self.likes.where(like: false).size
    end

    private
        def picture_size
            if picture.size > 5.megabytes
                errors.add(:picture, "Should be less than 5MB")
            end
        end
    
end