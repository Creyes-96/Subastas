class Product::BidsController < ApplicationController
    before_action :set_product_bid, only: %i[ show edit update destroy ]
    
    # GET /product/bids or /product/bids.json
    def index
        #@product_bids = Product::Bid.all
        @product_bids = Product::Bid.order(:amount).where(products_id: params[:product_id])
        @product_imagen = Product.find_by_id(params[:product_id])
    end
    
    # GET /product/bids/1 or /product/bids/1.json
    def show
        @productshow = Product.find_by_id(params[:product_id])
        
    end
    
    # GET /product/bids/new
    def new
        @product_bid = Product::Bid.new
        @productnew = Product.find_by_id(params[:product_id])
        @product_bids_max = Product::Bid.order(:amount).where(products_id: params[:product_id])
        @product_bids = Product::Bid.order(:amount).where(products_id: params[:product_id]).last
    end
    
    # GET /product/bids/1/edit
    def edit
        @product_imagen_edit = Product.find_by_id(params[:product_id])
    end
    
    # POST /product/bids or /product/bids.json
    def create
        @product_bids_max = Product::Bid.order(:amount).where(products_id: params[:product_id])
        @product_bids = Product::Bid.order(:amount).where(products_id: params[:product_id]).last
        @product_bid = Product::Bid.new(product_bid_params)
        @product_bid.product = Product.find_by_id(params[:product_id])
        @product_bid.user = current_user
        @productnew = Product.find_by_id(params[:product_id])
        if user_signed_in? 
            respond_to do |format|
                if @product_bid.save
                    format.html { redirect_to new_product_bid_url, notice: "Congratulations! Your bid has been placed successfully." }
                    format.json { render :show, status: :created, location: @product_bid }
                else
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render json: @product_bid.errors, status: :unprocessable_entity }
                end
            end
        else
            respond_to do |format|
                format.html { redirect_to new_product_bid_url, alert: "You must be Signed in to make a bid." }
                format.json { head :no_content }
            end
        end
    end
    
    # PATCH/PUT /product/bids/1 or /product/bids/1.json
    def update
        respond_to do |format|
            if @product_bid.update(product_bid_params)
                format.html { redirect_to @product_bid, notice: "Bid was successfully updated." }
                format.json { render :show, status: :ok, location: @product_bid }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @product_bid.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # DELETE /product/bids/1 or /product/bids/1.json
    def destroy
        @product_bid.destroy
        respond_to do |format|
            format.html { redirect_to product_bids_url, notice: "Bid was successfully destroyed." }
            format.json { head :no_content }
        end
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_bid
        @product_bid = Product::Bid.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def product_bid_params
        params.fetch(:product_bid, {}).permit(:amount)
    end

end
