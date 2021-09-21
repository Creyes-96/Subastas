class Product::Bid < ApplicationRecord
    
    after_save :valid_time
    belongs_to :user, foreign_key: 'users_id' 
    belongs_to :product, foreign_key: 'products_id'
    after_save :bid_enough
    before_save :bid_enough_actual

    validates :amount, presence: true, allow_blank: false

    protected
    # Validates the bid amount
    def bid_enough
        actual_bid = self.product.price
        max_amount = Product::Bid.maximum('amount')
        if amount <= self.product.price
            puts "***********************", actual_bid, "************************"
            errors.add(:base, "Bid must be above the actual bid.")
            raise ActiveRecord::Rollback 
        else
            puts "Felicidades"
        end
    end

    protected
    def bid_enough_actual
        #max_amount = Product::Bid.maximum('amount')
        
        @max_amount = Product::Bid.where(products_id: self.product.id).maximum("amount")
        if @max_amount.nil?
            @max_amount = 0
        end
        if amount <= @max_amount
            puts "***********************", @max_amount, "************************"
            errors.add(:base, "Bid must be above the actual bid.")
            raise ActiveRecord::Rollback 
        else
            puts "Felicidades"
        end
    end

    protected
    def valid_time
        deadline = self.product.limit_date

        if DateTime.now > deadline
            errors.add(:limit_date, "has passed. This product is no longer available.")
            raise ActiveRecord::Rollback 
        end


    end

    
end
