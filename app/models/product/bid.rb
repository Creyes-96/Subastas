class Product::Bid < ApplicationRecord
    
    belongs_to :user, foreign_key: 'users_id' 
    belongs_to :product, foreign_key: 'products_id'
    after_save :bid_enough
    before_save :bid_enough_actual

    protected
    # Validates the bid amount
    def bid_enough
        actual_bid = self.product.price
        max_amount = Product::Bid.maximum('amount')
        if amount < self.product.price
            puts "***********************", actual_bid, "************************"
            errors.add(:base, "El bid debe ser mayor al precio base")
            raise ActiveRecord::Rollback 
        else
            puts "Felicidades"
        end
    end

    protected
    def bid_enough_actual
        #max_amount = Product::Bid.maximum('amount')
        max_amount = Product::Bid.where(products_id: self.product.id).maximum("amount")

        if amount <= max_amount
            puts "***********************", max_amount, "************************"
            errors.add(:base, "El bid debe ser mayor al oferta mayor")
            raise ActiveRecord::Rollback 
        else
            puts "Felicidades"
        end
    end



    
end
