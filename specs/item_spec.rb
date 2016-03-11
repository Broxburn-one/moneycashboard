require( 'minitest/autorun' )
require( 'minitest/rg' )
require('time')
require_relative( '../models/item' )
require_relative( '../models/merchant' )
require_relative( '../models/transaction' )


class TestItem < MiniTest::Test

  def setup
    options = {
      'id' => 1,
      'name' => 'Utilities'
    }

    @item = Item.new( options)
  end

  def test_get_name
    assert_equal('Utilities', @item.name())
  end

end


 