class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.references :user

      t.string :name
      t.string :country_of_incorporation
      t.string :currency

      t.timestamps
    end
  end
end
