class Product::ReviewsController < ApplicationController
  before_action :set_product_review, only: %i[ show edit update destroy ]

  # GET /product/reviews or /product/reviews.json
  def index
    @product_reviews = Product::Review.all
  end

  # GET /product/reviews/1 or /product/reviews/1.json
  def show
  end

  # GET /product/reviews/new
  def new
    @product_review = Product::Review.new
  end

  # GET /product/reviews/1/edit
  def edit
  end

  # POST /product/reviews or /product/reviews.json
  def create
    @product_review = Product::Review.new(product_review_params)

    respond_to do |format|
      if @product_review.save
        format.html { redirect_to @product_review, notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @product_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product/reviews/1 or /product/reviews/1.json
  def update
    respond_to do |format|
      if @product_review.update(product_review_params)
        format.html { redirect_to @product_review, notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @product_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product/reviews/1 or /product/reviews/1.json
  def destroy
    @product_review.destroy
    respond_to do |format|
      format.html { redirect_to product_reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_review
      @product_review = Product::Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_review_params
      params.fetch(:product_review, {})
    end
end
