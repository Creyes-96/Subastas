class Product::Bid < ApplicationRecord
    belongs_to :user, foreign_key: 'users_id' 
    belongs_to :product, foreign_key: 'products_id'
end
