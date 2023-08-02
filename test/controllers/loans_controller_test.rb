
require 'test_helper'

class LoansControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    loans = assigns(:loans)
    assert_equal 2, loans.length
  end

  test "should get show" do
    loan = loans(:loan_one)
    get :show, params: { id: loan.id }
    assert_response :success
    assert_equal loan.id, assigns(:loan).id
  end
end
