require_relative('../models/transaction.rb')
require_relative('../models/item.rb')
require_relative('../models/merchant.rb')
require( 'pry-byebug' )

# Transaction.delete_all
# Item.delete_all
# Merchant.delete_all


# transaction1 = Transaction.create( { 
#           'tr_date' => "2016-03-16",
#            'merchant_id' => merchant1.id,
#            'item_id' =>  item1.id,
#           'value' => 30.25
#           } )

  item1 = Item.new( {
    'name' => 'Waitrose'
    })




binding.pry
nil
