# frozen_string_literal: true

class Cash < ApplicationRecord
  belongs_to :company
  has_many :transactions, dependent: :destroy

  MONTHLY_BALANCE_KEY = '{{MONTH}}-{{YEAR}}'

  before_create :build_remaining_balance

  class << self
    def build_monthly_balance_key(month, year)
      MONTHLY_BALANCE_KEY.gsub('{{MONTH}}', month.to_s).gsub('{{YEAR}}', year.to_s)
    end
  end

  private

  def build_remaining_balance
    self.remaining_balance = initial_balance
  end
end
