class Company < ApplicationRecord
  CURRENCIES = %W[USD EUR GBP PKR]

  belongs_to :user

  validates :name, :country_of_incorporation, :currency, presence: true
end
