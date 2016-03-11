require( 'minitest/autorun' )
require( 'minitest/rg' )
require('time')
require_relative( '../models/item' )
require_relative( '../models/merchant' )
require_relative( '../models/transaction' )



class TestMerchant < MiniTest::Test

  def setup
    options = {
      'id' => 1,
      'name' => 'Tesco'
    }

    @merchant = Merchant.new( options)
  end

  def test_get_name
    assert_equal('Tesco', @merchant.name)
  end

end