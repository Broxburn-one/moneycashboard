require_relative('../models/item.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')

#NEW
get '/transactions/new' do
  @items = Item.all
  @merchants = Merchant.all
  erb :"transactions/new"
end

# CREATE
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  # erb :"transactions/show"
  redirect to("/transactions")
end

#INDEX
get '/transactions' do

    @transactions = Transaction.all(params)

  erb :"transactions/index"
end

#SHOW
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb :"transactions/show"
end

#UPDATE
post '/transactions/:id' do
  @transaction = Transaction.new( params )
  @transaction.update()
  redirect to("/transactions/#{params['id']}")
end


#EDIT
get '/transactions/:id/edit' do

  @transaction = Transaction.find(params[:id])
  @merchants = Merchant.all
  @items = Item.all
  erb :"transactions/edit"
end

# #FILTER BY DATE
# get '/transactions/:date_from/:date_to' do
#   @transactions = Transaction.by_date(:date_from, :date_to)
#   erb :"transactions/filter"
# end






