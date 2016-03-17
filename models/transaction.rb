require( 'pg' )
require('time')
require('pry-byebug')
require_relative('../db/sql_runner')

require 'Date'


class Transaction

  attr_reader(:id, :tr_date, :item_id, :merchant_id, :amount)


  def initialize( options )
    @id = options['id'].to_i
    @tr_date = options['tr_date']
    @merchant_id = options['merchant_id'].to_i
    @item_id = options['item_id'].to_i
    @amount = options['amount'].to_f   # need to sort this out as float not recommended
  end

  def item()
    Item.find(@item_id)
    sql = "SELECT * FROM Items where id = #{@item_id}"
    Item.map_item(sql)
  end

  def merchant()
    Merchant.find(@merchant_id)
    sql = "SELECT * FROM Merchants where id = #{@merchant_id}"
    Merchant.map_item(sql)
  end


  def save

    sql = "INSERT INTO Transactions (
      tr_date,
      merchant_id,
      item_id,
      amount) 
      VALUES (
        '#{ @tr_date }',
        #{ @merchant_id }, 
        #{ @item_id },
        #{ @amount }
      )"
#  NB tr_date above needs the string interpolation quotes or it thinks it's integer.
    SqlRunner.run_sql( sql )
  end

 def date_format(date)
    Date.parse(date).strftime("%d-%m-%Y")
  end

  def update()
    sql = "UPDATE Transactions SET 
      tr_date = '#{ @tr_date }',
      merchant_id = #{ @merchant_id }, 
      item_id =  #{ @item_id },
      amount = #{ @amount }
     WHERE id = #{@id}"
    
    return SqlRunner.run_sql( sql )
  end


  def self.all(params)

      datefrom = Date.parse(params[:datefrom]).strftime("%Y-%m-%d") if params[:datefrom]
      dateto = Date.parse(params[:dateto]).strftime("%Y-%m-%d") if params[:dateto]
    # datefrom = Date.parse("1920-03-01")  # 1st of the month
    # dateto = Date.today.strftime("%Y-%m-%d") 
      datefrom.nil? ? datefr = Date.parse("1999-01-01") : datefr = Date.parse(datefrom)
      dateto.nil? ? datet = Date.today.strftime("%Y-%m-%d")  : datet = Date.parse(dateto)
  
# refactor this

    sql = "SELECT * FROM transactions WHERE tr_date BETWEEN '#{datefr}' AND '#{datet}' ORDER BY tr_date DESC"

    transaction = SqlRunner.run_sql(sql)
    result = transaction.map {  |t| Transaction.new(t)}

#  find range of dates
   #   sorted_by_date = result.sort { |a,b| a.tr_date <=> b.tr_date}
   # puts sorted_by_date.class
  
    return result
  end

  def self.delete_all
    sql = "DELETE FROM  Transactions"
    SqlRunner.run_sql(sql)
  end


 def self.find(id)
    sql = "SELECT * FROM Transactions WHERE id = #{id}"
    result = SqlRunner.run_sql( sql )
    transactions = SqlRunner.run_sql( sql )    
    transaction =  Transaction.new(result[0])
  end


#  this method wasn't used in the end.
  def self.by_date(date_from, date_to=Date.today)
#  summation of transaction table amounts; later acc to date range
#  first of the month Date.parse(date).strftime("01-%m-%Y")
    if !defined? date_from
      date_from = Date.today.strftime("%Y-%m-01")   # 1st of the month
    end
    if !defined? date_to
      date_to = Date.today.strftime("%Y-%m-%d") 
    end
# validation that date_from is BEFORE the date_to requires JS validaion or some other not available here?
    sql = "SELECT * FROM TRANSACTIONS WHERE tr_date BETWEEN date_from AND date_to ORDER BY tr_date DESC"
    transaction = SqlRunner.run_sql(sql)
    result = transaction.map {  |t| Transaction.new(t)}
    return result
  end













end
