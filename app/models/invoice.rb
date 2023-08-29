class Invoice < ApplicationRecord
  belongs_to :account
  has_many :transactions, dependent: :destroy

  validates :due_at, :total_amount, presence: true
end
