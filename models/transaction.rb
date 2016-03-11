require( 'pg' )
require('time')
require('pry-byebug')
require_relative('../db/sql_runner')


class Transaction

  attr_reader(:id, :tr_date, :item_id, :merchant_id)


  def initialize( options )
    @id = options['id']
    @tr_date = options['tr_date']
    @merchant_id = options['merchant_id']
    @item_id = options['item_id']
  end


  def date_format(date)
    Date.parse(date).strftime("%d-%m-%Y")
  end



end
