class Account < ApplicationRecord
  belongs_to :user
  has_many :invoices, dependent: :destroy
  has_many :transactions, dependent: :destroy

  validates :account_type, presence: true

  enum account_type: { basic: 0, premium: 1, enterprise: 2 }
end
