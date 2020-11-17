class Transaction < ApplicationRecord
  belongs_to :cash

  CASH_IN_CATS  = ['Revenues', 'Equity', 'Convertible Note', 'Bank Debt', 'Other']
  CASH_OUT_CATS = ['COGS', 'Employees', 'Services', 'Other Operating Expenses', 'Investments', 'Other']

  enum nature: %w[cash_in cash_out]

  before_create :check_monthly_balance_key
  after_create :deduct_remaining_balance

  private

  def check_monthly_balance_key
    monthly_balance_key = Cash.build_monthly_balance_key(DateTime.now.month, DateTime.now.year)
    return if cash.monthly_balance.key?(monthly_balance_key)

    monthly_balance = self.cash.monthly_balance.dup
    monthly_balance[monthly_balance_key] = cash.remaining_balance
    cash.update_column(:monthly_balance, monthly_balance)
  end

  def deduct_remaining_balance
    if cash_in?
      remaining_balance = cash.remaining_balance + amount
    else
      remaining_balance = cash.remaining_balance - amount
    end
    cash.update_column(:remaining_balance, remaining_balance)
  end
end
