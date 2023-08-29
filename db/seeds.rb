# db/seeds.rb
require 'faker'
require 'activerecord-import/base'
require 'activerecord-import/active_record/adapters/postgresql_adapter'

# Transaction.delete_all
# Invoice.delete_all
# Account.delete_all
# User.delete_all

# users = []
# accounts = []
# invoices = []
# transactions = []

# 10_000.times do |i|
#   puts "Still working: #{i}" if i % 100 == 0

#   email = Faker::Internet.email
#   password = Faker::Internet.password(min_length: 8)

#   user = User.create(email: email, password: password, password_confirmation: password)

#   if user.persisted?
#     account_type = ["Basic", "Premium", "Enterprise"].sample
#     accounts << Account.new(user_id: user.id, account_type: account_type)

#     1_000.times do
#       due_at = Faker::Date.forward(days: 60)
#       total_amount = Faker::Commerce.price(range: 0..1000.0)

#       invoices << Invoice.new(account_id: user.id, due_at: due_at, total_amount: total_amount)
#     end

#     invoice_ids_for_account = (i * 1000...(i + 1) * 1000).to_a

#     1_000.times do
#       invoice_id = invoice_ids_for_account.sample
#       amount = Faker::Commerce.price(range: 0..500.0)
#       status = ["pending", "completed", "failed"].sample
#       description = Faker::Commerce.product_name

#       transactions << Transaction.new(account_id: user.id, invoice_id: invoice_id, amount: amount, status: status, description: description)
#     end
#   end
# end

# Account.import accounts, validate: false
# Invoice.import invoices, validate: false
# Transaction.import transactions, validate: false

# puts "Seed data generated!"


  user = User.last

  if user.persisted?
    account_type = ["basic", "premium", "enterprise"].sample
    account = Account.new(user_id: user.id, account_type: account_type)
    account.save

    1_000.times do
      due_at = Faker::Date.forward(days: 60)
      total_amount = Faker::Commerce.price(range: 0..1000.0)

      invoice = Invoice.new(account_id: account.id, due_at: due_at, total_amount: total_amount)
      invoice.save!
      invoice_id = invoice.id
      amount = Faker::Commerce.price(range: 0..500.0)
      status = ["pending", "completed", "failed"].sample
      description = Faker::Commerce.product_name

      Transaction.create!(account_id: account.id, invoice_id: invoice_id, amount: amount, status: status, description: description)
      puts "*"
    end    
  end
