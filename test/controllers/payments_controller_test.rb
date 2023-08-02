require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  test "should get index" do
    loan = loans(:loan_one)
    get :index, params: { loan_id: loan.id }
    assert_response :success
    payments = assigns(:payments)
    assert_equal 1, payments.length
  end

  test "should get show" do
    payment = payments(:payment_one)
    get :show, params: { id: payment.id }
    assert_response :success
    assert_equal payment.id, assigns(:payment).id
  end

  test "should create payment with valid data" do
    loan = loans(:loan_two)
    assert_difference('Payment.count', 1) do
      post :create, params: { loan_id: loan.id, payment: { payment_date: Date.today, amount: 500.00 } }
    end
    assert_response :success
  end

  test "should not create payment if amount exceeds outstanding balance" do
    loan = loans(:loan_one)
    assert_no_difference('Payment.count') do
      post :create, params: { loan_id: loan.id, payment: { payment_date: Date.today, amount: 1500.00 } }
    end
    assert_response :unprocessable_entity
    assert_includes JSON.parse(response.body)["errors"], "Amount cannot exceed the outstanding balance of the loan"
  end
end
