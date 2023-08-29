class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :invoice

  validates :amount, :status, presence: true

  enum status: { pending: 0, completed: 1, failed: 2 }
end
