require( 'minitest/autorun' )
require( 'minitest/rg' )
require('time')
require_relative( '../models/item' )
require_relative( '../models/merchant' )
require_relative( '../models/transaction' )



class TestMerchant < MiniTest::Test

  def setup
    options = {
      'tr_date' => '2016-03-11', 
      'merchant_id' => 1,
      'item_id' => 1,
      'amount' => 12.25
    }

    @merchant = Transaction.new( options)
  end



end