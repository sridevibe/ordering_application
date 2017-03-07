require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get description:string" do
    get :description:string
    assert_response :success
  end

  test "should get stock_count:integer" do
    get :stock_count:integer
    assert_response :success
  end

  test "should get catalog_id:integer" do
    get :catalog_id:integer
    assert_response :success
  end

end
