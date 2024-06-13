require "test_helper"

class PoliticiansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @politician = politicians(:one)
  end

  test "should get index" do
    get politicians_url
    assert_response :success
  end

  test "should get new" do
    get new_politician_url
    assert_response :success
  end

  test "should create politician" do
    assert_difference("Politician.count") do
      post politicians_url, params: { politician: {  } }
    end

    assert_redirected_to politician_url(Politician.last)
  end

  test "should show politician" do
    get politician_url(@politician)
    assert_response :success
  end

  test "should get edit" do
    get edit_politician_url(@politician)
    assert_response :success
  end

  test "should update politician" do
    patch politician_url(@politician), params: { politician: {  } }
    assert_redirected_to politician_url(@politician)
  end

  test "should destroy politician" do
    assert_difference("Politician.count", -1) do
      delete politician_url(@politician)
    end

    assert_redirected_to politicians_url
  end
end
