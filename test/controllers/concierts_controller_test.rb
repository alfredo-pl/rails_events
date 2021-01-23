require 'test_helper'

class ConciertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conciert = concierts(:one)
  end

  test "should get index" do
    get concierts_url
    assert_response :success
  end

  test "should get new" do
    get new_conciert_url
    assert_response :success
  end

  test "should create conciert" do
    assert_difference('Conciert.count') do
      post concierts_url, params: { conciert: { date: @conciert.date, duration: @conciert.duration, group_id: @conciert.group_id, people: @conciert.people } }
    end

    assert_redirected_to conciert_url(Conciert.last)
  end

  test "should show conciert" do
    get conciert_url(@conciert)
    assert_response :success
  end

  test "should get edit" do
    get edit_conciert_url(@conciert)
    assert_response :success
  end

  test "should update conciert" do
    patch conciert_url(@conciert), params: { conciert: { date: @conciert.date, duration: @conciert.duration, group_id: @conciert.group_id, people: @conciert.people } }
    assert_redirected_to conciert_url(@conciert)
  end

  test "should destroy conciert" do
    assert_difference('Conciert.count', -1) do
      delete conciert_url(@conciert)
    end

    assert_redirected_to concierts_url
  end
end
