require 'test_helper'

class EateriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eatery = eateries(:one)
  end

  test "should get index" do
    get eateries_url
    assert_response :success
  end

  test "should get new" do
    get new_eatery_url
    assert_response :success
  end

  test "should create eatery" do
    assert_difference('Eatery.count') do
      post eateries_url, params: { eatery: { address: @eatery.address, description: @eatery.description, name: @eatery.name } }
    end

    assert_redirected_to eatery_url(Eatery.last)
  end

  test "should show eatery" do
    get eatery_url(@eatery)
    assert_response :success
  end

  test "should get edit" do
    get edit_eatery_url(@eatery)
    assert_response :success
  end

  test "should update eatery" do
    patch eatery_url(@eatery), params: { eatery: { address: @eatery.address, description: @eatery.description, name: @eatery.name } }
    assert_redirected_to eatery_url(@eatery)
  end

  test "should destroy eatery" do
    assert_difference('Eatery.count', -1) do
      delete eatery_url(@eatery)
    end

    assert_redirected_to eateries_url
  end
end
