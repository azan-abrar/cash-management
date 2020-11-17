class CreateCashes < ActiveRecord::Migration[6.0]
  def change
    create_table :cashes do |t|
      t.references :company

      t.float :initial_balance
      t.float :remaining_balance
      t.jsonb :monthly_balance, default: {}

      t.timestamps
    end
  end
end
