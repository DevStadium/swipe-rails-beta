class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @transactions = current_user.account.transactions.includes(:invoice).order(created_at: :desc)
  end
end
