class CreateProducts < ActiveRecord::Migration[6.1]
    def change
        create_table :products do |t|
            t.string :name
            t.text :description
            t.float :price
            t.datetime :limit_date
            
            t.timestamps
        end
        add_reference :products, :users, foreign_key:true
    end
end
