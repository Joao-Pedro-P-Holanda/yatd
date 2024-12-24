require "application_system_test_case"

class PurchaseLinksTest < ApplicationSystemTestCase
  setup do
    @purchase_link = purchase_links(:one)
  end

  test "visiting the index" do
    visit purchase_links_url
    assert_selector "h1", text: "Purchase links"
  end

  test "should create purchase link" do
    visit purchase_links_url
    click_on "New purchase link"

    check "Complete" if @purchase_link.complete
    fill_in "Url", with: @purchase_link.url
    click_on "Create Purchase link"

    assert_text "Purchase link was successfully created"
    click_on "Back"
  end

  test "should update Purchase link" do
    visit purchase_link_url(@purchase_link)
    click_on "Edit this purchase link", match: :first

    check "Complete" if @purchase_link.complete
    fill_in "Url", with: @purchase_link.url
    click_on "Update Purchase link"

    assert_text "Purchase link was successfully updated"
    click_on "Back"
  end

  test "should destroy Purchase link" do
    visit purchase_link_url(@purchase_link)
    click_on "Destroy this purchase link", match: :first

    assert_text "Purchase link was successfully destroyed"
  end
end
