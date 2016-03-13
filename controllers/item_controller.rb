require_relative('../models/item.rb')
require_relative('../models/merchant.rb')

  #INDEX
get '/items' do
  @items = Item.all()
  erb :"items/index"
end

  #NEW
get '/items/new' do
  erb :"items/new"
end

  #SHOW
get '/items/:id' do
 @item = Item.find(params[:id])
  erb :"items/show"
end

#EDIT
get '/items/:id/edit' do
  @item = Item.find(params[:id])
  erb :"items/edit"
end

  #CREATE
post '/items' do
  @item = Item.new( params )
  @item.save()
  redirect to("/items")
end


#UPDATE
post '/items/:id' do
  @item = Item.new( params )
  @item.update()
  redirect to("/items/#{params['id']}")
end


#DELETE
post '/items/:id/delete' do
  Item.destroy(params[:id])
  redirect to('/items')
end