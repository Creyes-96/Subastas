class CreateProductBids < ActiveRecord::Migration[6.1]
    def change
        create_table :product_bids do |t|
            t.float :amount
            t.datetime :bid_date
            t.timestamps
        end
        add_reference :product_bids, :products, foreign_key:true
    end
end
