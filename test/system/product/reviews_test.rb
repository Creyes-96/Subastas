require "application_system_test_case"

class Product::ReviewsTest < ApplicationSystemTestCase
  setup do
    @product_review = product_reviews(:one)
  end

  test "visiting the index" do
    visit product_reviews_url
    assert_selector "h1", text: "Product/Reviews"
  end

  test "creating a Review" do
    visit product_reviews_url
    click_on "New Product/Review"

    click_on "Create Review"

    assert_text "Review was successfully created"
    click_on "Back"
  end

  test "updating a Review" do
    visit product_reviews_url
    click_on "Edit", match: :first

    click_on "Update Review"

    assert_text "Review was successfully updated"
    click_on "Back"
  end

  test "destroying a Review" do
    visit product_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review was successfully destroyed"
  end
end
