require( 'sinatra' )
require( 'pry-byebug' )
require 'sinatra/contrib/all' if development?

require_relative('controllers/item_controller')
require_relative('controllers/merchant_controller')
require_relative('controllers/transaction_controller')


get '/' do
  erb :"home"
end