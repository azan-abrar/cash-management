# frozen_string_literal: true

class Student::CompaniesController < Student::BaseController
  before_action :set_company, only: %i[edit update show destroy]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
    @company.build_cash
  end

  def create
    @company = current_user.companies.new(company_params)

    if @company.save
      redirect_to student_companies_path, notice: 'Company was successfully created.'
    else
      @company.build_cash
      render :new
    end
  end

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to student_companies_path, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @cash = @company.cash
  end

  def destroy
    @company.destroy
    redirect_to student_companies_path, notice: 'Company was successfully destroyed.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :country_of_incorporation, :currency, cash_attributes: %i[initial_balance])
  end
end
