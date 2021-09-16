class Product < ApplicationRecord
    validate :check_file_presence
    belongs_to :user, foreign_key: 'users_id' 
    has_one_attached :image

    validates :price, :numericality => { :greater_than_or_equal_to => 0 }


    def check_file_presence
        errors.add(:image, "file has not been attached") unless image.attached?
    end
end
