require "test_helper"

class TwodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twodo = twodos(:one)
  end

  test "should get index" do
    get twodos_url
    assert_response :success
  end

  test "should get new" do
    get new_twodo_url
    assert_response :success
  end

  test "should create twodo" do
    assert_difference("Twodo.count") do
      post twodos_url, params: { twodo: { name: @twodo.name, status: @twodo.status } }
    end

    assert_redirected_to twodo_url(Twodo.last)
  end

  test "should show twodo" do
    get twodo_url(@twodo)
    assert_response :success
  end

  test "should get edit" do
    get edit_twodo_url(@twodo)
    assert_response :success
  end

  test "should update twodo" do
    patch twodo_url(@twodo), params: { twodo: { name: @twodo.name, status: @twodo.status } }
    assert_redirected_to twodo_url(@twodo)
  end

  test "should destroy twodo" do
    assert_difference("Twodo.count", -1) do
      delete twodo_url(@twodo)
    end

    assert_redirected_to twodos_url
  end
end
