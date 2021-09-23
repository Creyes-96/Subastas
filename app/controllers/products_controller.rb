class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show edit update destroy ]
    
    # GET /products or /products.json
    def index
        # p Product.all.order(:id).to_sql
        # p "*************Index para la vista VUE****************"
        #@products = Product.all
        #@x = Product::Bid.order(:created_at).last
        
        # @products = Product.all.order(:id)
        
        # @products.each do |product|
        # max_bind = Product::Bid.where(products_id: product.id).order(:amount).last
        
        # product.attributes.merge({
        # max_bind: max_bind
        # })
        # end
        # debugger
        
        @products = Product.all.order(:id)

        @products.map do |product|
            @major_bid = Product::Bid.order(:amount).where(products_id: product.id).last
        end

        #puts @products.ids , "Alo alo alo alo aol alo alo a lo alo alo"
        #puts @major_bid.amount , "Alo alo alo alo alo alo alo alo alo"
        #puts @products.ids , "Alo alo alo alo aol alo alo a lo alo alo"
        #render json: @products
    
    end
    
    def mysales
        @items = Product.where(users_id: params[:user_id])
    end
    
    # GET /products/1 or /products/1.json
    def show
    end
    
    # GET /products/new
    def new
        @product = Product.new
    end
    
    # GET /products/1/edit
    def edit
        
    end
    
    # POST /products or /products.json
    def create
        @product = Product.new(product_params)
        @product.user = current_user
        respond_to do |format|
            if @product.save
                format.html { redirect_to @product, notice: "Product was successfully created." }
                format.json { render :show, status: :created, location: @product }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @product.errors, status: :unprocessable_entity }
            end
        end
    end

    
    # PATCH/PUT /products/1 or /products/1.json
    def update
        respond_to do |format|
            if @product.update(product_params)
                format.html { redirect_to myitems_path, notice: "Product was successfully updated." }
                format.json { render :show, status: :ok, location: @product }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @product.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # DELETE /products/1 or /products/1.json
    def destroy
        #@product.destroy
        #respond_to do |format|
        #    format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
        #    format.json { head :no_content }
        #end
        if @product.destroy
            flash[:notice] = "Action performed successfully"
            redirect_to myitems_path      
          else
            flash[:alert] = "You can't delete a product that already has bids from users."
            redirect_to myitems_path
          end
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
        @product = Product.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def product_params
        params.fetch(:product, {}).permit(:name, :description, :price, :limit_date, :image)
    end
end