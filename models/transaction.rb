require( 'pg' )
require('time')
require('pry-byebug')
require_relative('../db/sql_runner')


class Transaction

  attr_reader(:id, :tr_date, :item_id, :merchant_id, :amount)


  def initialize( options )
    @id = options['id'].to_i
    @tr_date = options['tr_date']
    @merchant_id = options['merchant_id'].to_i
    @item_id = options['item_id'].to_i,
    @amount = options['amount'].to_f   # need to sort this out as float not recommended

    # @item = Item.find(options['item_id'])
    # @merchant = Merchant.find(options['merchant_id'])
  end


  def date_format(date)
    Date.parse(date).strftime("%d-%m-%Y")
  end

  def item()
    Item.find(@item_id)
    sql = "SELECT * FROM Items where id = #{@item_id}"
    Item.map_item(sql)
  end

  def merchant()
    Merchant.find(@merchant_id)
    sql = "SELECT * FROM Merchant where id = #{@merchant_id}"
    Merchant.map_item(sql)
  end

  def save
    sql = "INSERT INTO transactions (
      tr_date,
      merchant_id,
      item_id,
      amount) 
      VALUES (
        #{ @tr_date},
        #{ @merchant_id }, 
        #{ @item_id },
        #{ @amount }
      )"
    SqlRunner.run_sql( sql )
  end

  def self.all
    sql = "SELECT * FROM transactions"
    transaction = SqlRunner.run_sql(sql)
    result = transaction.map {  |t| Transaction.new(t)}
    return result
  end

  def self.delete_all
    sql = "DELETE * from  Transactions"
    SqlRunner. run_sql(sql)
  end


end
