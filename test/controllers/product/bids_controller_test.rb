require "test_helper"

class Product::BidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_bid = product_bids(:one)
  end

  test "should get index" do
    get product_bids_url
    assert_response :success
  end

  test "should get new" do
    get new_product_bid_url
    assert_response :success
  end

  test "should create product_bid" do
    assert_difference('Product::Bid.count') do
      post product_bids_url, params: { product_bid: {  } }
    end

    assert_redirected_to product_bid_url(Product::Bid.last)
  end

  test "should show product_bid" do
    get product_bid_url(@product_bid)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_bid_url(@product_bid)
    assert_response :success
  end

  test "should update product_bid" do
    patch product_bid_url(@product_bid), params: { product_bid: {  } }
    assert_redirected_to product_bid_url(@product_bid)
  end

  test "should destroy product_bid" do
    assert_difference('Product::Bid.count', -1) do
      delete product_bid_url(@product_bid)
    end

    assert_redirected_to product_bids_url
  end
end
