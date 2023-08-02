class Payment < ApplicationRecord
  belongs_to :loan

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :loan_id, presence: true

  validate :amount_not_exceeds_outstanding_balance

  private

  def amount_not_exceeds_outstanding_balance
    if amount.present? && amount > loan.outstanding_balance
      errors.add(:amount, "cannot exceed the outstanding balance of the loan")
    end
  end

end
