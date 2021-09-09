require "test_helper"

class Product::ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_review = product_reviews(:one)
  end

  test "should get index" do
    get product_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_product_review_url
    assert_response :success
  end

  test "should create product_review" do
    assert_difference('Product::Review.count') do
      post product_reviews_url, params: { product_review: {  } }
    end

    assert_redirected_to product_review_url(Product::Review.last)
  end

  test "should show product_review" do
    get product_review_url(@product_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_review_url(@product_review)
    assert_response :success
  end

  test "should update product_review" do
    patch product_review_url(@product_review), params: { product_review: {  } }
    assert_redirected_to product_review_url(@product_review)
  end

  test "should destroy product_review" do
    assert_difference('Product::Review.count', -1) do
      delete product_review_url(@product_review)
    end

    assert_redirected_to product_reviews_url
  end
end
