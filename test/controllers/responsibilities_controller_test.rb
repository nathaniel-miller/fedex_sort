require 'test_helper'

class ResponsibilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @responsibility = responsibilities(:one)
  end

  test "should get index" do
    get responsibilities_url
    assert_response :success
  end

  test "should get new" do
    get new_responsibility_url
    assert_response :success
  end

  test "should create responsibility" do
    assert_difference('Responsibility.count') do
      post responsibilities_url, params: { responsibility: {  } }
    end

    assert_redirected_to responsibility_url(Responsibility.last)
  end

  test "should show responsibility" do
    get responsibility_url(@responsibility)
    assert_response :success
  end

  test "should get edit" do
    get edit_responsibility_url(@responsibility)
    assert_response :success
  end

  test "should update responsibility" do
    patch responsibility_url(@responsibility), params: { responsibility: {  } }
    assert_redirected_to responsibility_url(@responsibility)
  end

  test "should destroy responsibility" do
    assert_difference('Responsibility.count', -1) do
      delete responsibility_url(@responsibility)
    end

    assert_redirected_to responsibilities_url
  end
end
