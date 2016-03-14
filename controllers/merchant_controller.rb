require_relative('../models/item.rb')
require_relative('../models/merchant.rb')

  #INDEX
get '/merchants' do
  @merchants = Merchant.all()
  erb :"merchants/index"
end

get '/merchants/new' do
  #NEW
  erb :"merchants/new"
end


  #SHOW
get '/merchants/:id' do
  #SHOW
  @merchant = Merchant.find(params[:id])
  erb :"merchants/show"
end


  #EDIT
get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb :"merchants/edit"
end


  #CREATE
post '/merchants' do

  @merchant = Merchant.new( params )
  @merchant.save()
  redirect to("/merchants")
end

  #UPDATE
post '/merchants/:id' do

  @merchant = Merchant.new( params )
  @merchant.update()
  redirect to("/merchants/#{params['id']}")
end

  #DELete
post '/merchants/:id/delete' do
  Merchant.destroy(params[:id])
  redirect to('/merchants')
end