require "application_system_test_case"

class Product::BidsTest < ApplicationSystemTestCase
  setup do
    @product_bid = product_bids(:one)
  end

  test "visiting the index" do
    visit product_bids_url
    assert_selector "h1", text: "Product/Bids"
  end

  test "creating a Bid" do
    visit product_bids_url
    click_on "New Product/Bid"

    click_on "Create Bid"

    assert_text "Bid was successfully created"
    click_on "Back"
  end

  test "updating a Bid" do
    visit product_bids_url
    click_on "Edit", match: :first

    click_on "Update Bid"

    assert_text "Bid was successfully updated"
    click_on "Back"
  end

  test "destroying a Bid" do
    visit product_bids_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bid was successfully destroyed"
  end
end
