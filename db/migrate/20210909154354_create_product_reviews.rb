class CreateProductReviews < ActiveRecord::Migration[6.1]
    def change
        create_table :product_reviews do |t|
            t.text :review
            t.timestamps
        end
        add_reference :product_reviews, :products, foreign_key:true
        add_reference :product_reviews, :users, foreign_key:true
    end
end
