require 'test_helper'

class AttendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attend = attends(:one)
  end

  test "should get index" do
    get attends_url
    assert_response :success
  end

  test "should get new" do
    get new_attend_url
    assert_response :success
  end

  test "should create attend" do
    assert_difference('Attend.count') do
      post attends_url, params: { attend: { end_at: @attend.end_at, start_at: @attend.start_at, user_id: @attend.user_id } }
    end

    assert_redirected_to attend_url(Attend.last)
  end

  test "should show attend" do
    get attend_url(@attend)
    assert_response :success
  end

  test "should get edit" do
    get edit_attend_url(@attend)
    assert_response :success
  end

  test "should update attend" do
    patch attend_url(@attend), params: { attend: { end_at: @attend.end_at, start_at: @attend.start_at, user_id: @attend.user_id } }
    assert_redirected_to attend_url(@attend)
  end

  test "should destroy attend" do
    assert_difference('Attend.count', -1) do
      delete attend_url(@attend)
    end

    assert_redirected_to attends_url
  end
end