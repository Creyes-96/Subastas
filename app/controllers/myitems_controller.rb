class MyitemsController < ApplicationController
    def index
        @items = Product.where(users_id: current_user.id)
    end
end
