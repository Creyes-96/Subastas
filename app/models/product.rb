class Product < ApplicationRecord
    #validate :check_file_presence
    validate :expiration_date_cannot_be_in_the_past
    belongs_to :user, foreign_key: 'users_id' 
    has_one_attached :image
    has_many :product_bid, dependent: :restrict_with_error, class_name: 'Product::Bid', foreign_key: 'products_id'

    validates :name, presence: true, allow_blank: false
    validates :description, presence: true, allow_blank: false
    validates :price, presence: true, allow_blank: false
    validates :limit_date, presence: true, allow_blank: false
    
    validates :price, :numericality => { :greater_than_or_equal_to => 0 }
    
    
    def check_file_presence
        errors.add(:image, "file has not been attached") unless image.attached?
    end
    
    def expiration_date_cannot_be_in_the_past
        if limit_date < DateTime.now
            errors.add(:limit_date, "can't be in the past")
            raise ActiveRecord::Rollback 
        end
    end 

end
