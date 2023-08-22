class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_account

  has_one :account, dependent: :destroy

  private

  def create_account
    Account.create(user: self, account_type: :basic)
  end
end
