
require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test "should not save payment without amount" do
    payment = Payment.new(payment_date: Date.today)
    assert_not payment.save
  end

  test "should not save payment with amount exceeding outstanding balance" do
    loan = loans(:loan_one)
    payment = Payment.new(loan: loan, payment_date: Date.today, amount: 1500.00)
    assert_not payment.save
  end

  test "should save payment with valid data" do
    loan = loans(:loan_two)
    payment = Payment.new(loan: loan, payment_date: Date.today, amount: 500.00)
    assert payment.save
  end
end
