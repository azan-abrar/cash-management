# frozen_string_literal: true

class Company < ApplicationRecord
  CURRENCIES = %W[USD EUR GBP PKR]

  belongs_to :user
  has_one :cash, dependent: :destroy

  validates :name, :country_of_incorporation, :currency, presence: true

  accepts_nested_attributes_for :cash, reject_if: :all_blank
end
