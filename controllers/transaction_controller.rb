require_relative('../models/item.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')

get '/transactions/new' do
  #NEW
  @items = Item.all
  @merchants = Merchant.all
  erb :"transactions/new"
end

# CREATE
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb :"transactions/show"
end

get '/transactions' do
  @transactions = Transaction.all
  erb :"transactions/index"
end