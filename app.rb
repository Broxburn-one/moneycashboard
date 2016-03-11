require( 'sinatra' )
require( 'pry-byebug' )
require_relative('controllers/item_controller')
require_relative('controllers/merchant_controller')
require_relative('controllers/transaction_controller')
require 'sinatra/contrib/all' if development?

get '/' do
  erb :"home"
end