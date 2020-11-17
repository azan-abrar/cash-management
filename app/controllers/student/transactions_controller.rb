# frozen_string_literal: true

class Student::TransactionsController < Student::BaseController
  before_action :load_company

  def new
    @transaction = @cash.transactions.new(nature: Transaction.natures.key(params[:cash].to_i))
  end

  def create
    transaction = @cash.transactions.new(transaction_params)

    if transaction.save
      flash[:notice] = 'New cash in has been created successfully!'
    else
      flash[:alert] = transaction.errors.full_messages.to_sentence
    end

    redirect_to student_company_path(@company.id)
  end

  private

  def load_company
    @company = Company.find(params[:company_id])
    @cash    = @company.cash
  end

  def transaction_params
    params.require(:transaction).permit(:nature, :category, :other, :amount)
  end
end
