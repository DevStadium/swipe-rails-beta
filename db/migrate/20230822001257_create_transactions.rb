class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :account, foreign_key: true
      t.references :invoice, foreign_key: true 
      t.float :amount
      t.string :status
      t.string :description
      t.timestamps
    end
  end
end
