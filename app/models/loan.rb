class Loan < ActiveRecord::Base
  has_many :payments

  validates :funded_amount, presence: true, numericality: { greater_than: 0 }

  def outstanding_balance
    self.funded_amount - self.payments.sum(:amount)
  end

end
