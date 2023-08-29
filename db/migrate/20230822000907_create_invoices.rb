class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :account, foreign_key: true
      t.datetime :due_at
      t.float :total_amount

      t.timestamps
    end
  end
end
