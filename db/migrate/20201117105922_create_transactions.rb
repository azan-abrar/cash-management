class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :cash

      t.integer :nature
      t.float   :amount
      t.string  :category
      t.string  :other

      t.timestamps
    end
  end
end
