require_relative('../models/transaction.rb')
require_relative('../models/item.rb')
require_relative('../models/merchant.rb')
require( 'pry-byebug' )

Transaction.delete_all
Item.delete_all
Merchant.delete_all



  item1 = Item.new( {
    'id' => 1,
    'name' => 'Basic food'
    })

  item2 = Item.new( {
    'id' => 2,
    'name' => 'Alcohol'
    })

  merchant1 = Merchant.new( {
    'id' => 3,
    'name' => 'Waitrose'
    })

  merchant2 = Merchant.new( {
    'id' => 4,
    'name' => 'Aldi'
    })


transaction1 = Transaction.new( { 
          'tr_date' => "2016-03-16",
            'item_id' =>  item1.id,         
           'merchant_id' => merchant1.id,
          'amount' => 30.25
          } )

transaction2 = Transaction.new( { 
          'tr_date' => "2016-03-17",
           'item_id' =>  item2.id,          
           'merchant_id' => merchant2.id,
          'amount' => 12.17   
                 } )

transaction1.save()
transaction2.save()


binding.pry
nil
