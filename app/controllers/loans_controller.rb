class LoansController < ActionController::API
  def index
    @loans = Loan.all
    render json: @loans, methods: :outstanding_balance
  end

  def show
    @loan = Loan.find(params[:id])
    render json: @loan, methods: :outstanding_balance
  end
end
