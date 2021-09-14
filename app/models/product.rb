class Product < ApplicationRecord
    belongs_to :user, foreign_key: 'users_id' 
    has_one_attached :image
end
