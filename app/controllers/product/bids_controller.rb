class Product::BidsController < ApplicationController
  before_action :set_product_bid, only: %i[ show edit update destroy ]

  # GET /product/bids or /product/bids.json
  def index
    @product_bids = Product::Bid.all
  end

  # GET /product/bids/1 or /product/bids/1.json
  def show
  end

  # GET /product/bids/new
  def new
    @product_bid = Product::Bid.new
  end

  # GET /product/bids/1/edit
  def edit
  end

  # POST /product/bids or /product/bids.json
  def create
    @product_bid = Product::Bid.new(product_bid_params)

    respond_to do |format|
      if @product_bid.save
        format.html { redirect_to @product_bid, notice: "Bid was successfully created." }
        format.json { render :show, status: :created, location: @product_bid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_bid.errors, status: :unprocessable_entity }
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
      params.fetch(:product_bid, {})
    end
end
