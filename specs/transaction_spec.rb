require( 'minitest/autorun' )
require( 'minitest/rg' )
require('time')
require_relative( '../models/transaction' )



class TestTransaction < MiniTest::Test

  def setup
    options = {
      'tr_date' => '2016-03-11', 
      'merchant_id' => 1,
      'item_id' => 1,
      'amount' => 12.25
    }

    @transaction = Transaction.new( options)
  end

  def test_date
    assert_equal('2016-03-11', @transaction.tr_date())
  end

  def test_date_format
    assert_equal('11-03-2016', @transaction.date_format('2016-03-11'))
  end


  def test_merchant_id
    assert_equal(1, @transaction.merchant_id)
  end

  def test_item_id
    assert_equal(1, @transaction.item_id)
  end








end