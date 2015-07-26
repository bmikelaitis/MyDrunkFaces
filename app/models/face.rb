class Face < ActiveRecord::Base 
    belongs_to :user
    validates :user_id, presence:true
    validates :description, presence: true, length: { minimum: 4, maximum: 120 }
    mount_uploader :picture, PictureUploader
    validates :picture, presence:true
    validate :picture_size

    private
        def picture_size
            if picture.size > 5.megabytes
                errors.add(:picture, "Should be less than 5MB")
            end
        end
    
end