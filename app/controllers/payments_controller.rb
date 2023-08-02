class PaymentsController < ApplicationController
  before_action :set_loan, only: [:index, :create]

  def index
    @payments = @loan.payments
    render json: @payments
  end

  def show
    @payment = Payment.find(params[:id])
    render json: @payment
  end

  def create
    @payment = @loan.payments.build(payment_params)
    if @payment.save
      render json: @payment
    else
      render json: { errors: @payment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:loan_id])
  end

  def payment_params
    params.require(:payment).permit(:payment_date, :amount)
  end
end
