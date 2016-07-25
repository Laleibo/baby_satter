require 'test_helper'

class PetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pet_index_url
    assert_response :success
  end

  test "should get new" do
    get pet_new_url
    assert_response :success
  end

  test "should get create" do
    get pet_create_url
    assert_response :success
  end

  test "should get show" do
    get pet_show_url
    assert_response :success
  end

end
