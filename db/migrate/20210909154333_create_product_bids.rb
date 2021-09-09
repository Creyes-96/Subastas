class CreateProductBids < ActiveRecord::Migration[6.1]
  def change
    create_table :product_bids do |t|

      t.timestamps
    end
  end
end
