require "test_helper"

class PurchaseLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_link = purchase_links(:one)
  end

  test "should get index" do
    get purchase_links_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_link_url
    assert_response :success
  end

  test "should create purchase_link" do
    assert_difference("PurchaseLink.count") do
      post purchase_links_url, params: { purchase_link: { complete: @purchase_link.complete, url: @purchase_link.url } }
    end

    assert_redirected_to purchase_link_url(PurchaseLink.last)
  end

  test "should show purchase_link" do
    get purchase_link_url(@purchase_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_link_url(@purchase_link)
    assert_response :success
  end

  test "should update purchase_link" do
    patch purchase_link_url(@purchase_link), params: { purchase_link: { complete: @purchase_link.complete, url: @purchase_link.url } }
    assert_redirected_to purchase_link_url(@purchase_link)
  end

  test "should destroy purchase_link" do
    assert_difference("PurchaseLink.count", -1) do
      delete purchase_link_url(@purchase_link)
    end

    assert_redirected_to purchase_links_url
  end
end
