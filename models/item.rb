require( 'pg' )
require('time')
require('pry-byebug')
require_relative('../db/sql_runner')


class Item

  attr_reader(:id, :name)

  def initialize( options )
    @id = options['id']
    @name = options['name']
  end

#  save entries to db
  def save()
    sql = "INSERT INTO Items (name) VALUES ('#{ @name }')"
    SqlRunner.run_sql( sql )
    return last_entry()
  end

  def last_entry
    sql = "SELECT * FROM Items ORDER BY id DESC limit 1;"
    return Item.map_item(sql)
  end

  # def merchants()
  #   sql = "SELECT m.* FROM Merchants u INNER JOIN Transactions t ON t.merchant_id = m.id WHERE t.item_id = #{@id};"
  #   return Merchant.map_items(sql)
  # end
  



#  causing some problems with id
  # def self.find(1)
  def self.find(id)
    sql = "SELECT * FROM Items WHERE id = #{id}"
        result = SqlRunner.run_sql( sql )
    items = SqlRunner.run_sql( sql )    
    item = Item.new(result[0])
  end



  def self.all()
    sql = "SELECT * FROM Items"
    return Item.map_items(sql)
  end


  def update()
    sql = "UPDATE items SET name = '#{ @name }' WHERE id = #{@id}"
    return SqlRunner.run_sql( sql )
  end

#  create array of item objects
  def self.map_items(sql)
    item = SqlRunner.run_sql(sql)
    result = item.map { |n| Item.new( n ) }
    return result
  end

# return array of item names
  def self.map_item(sql)
    result = Item.map_items(sql)
    return result.first
  end

  def self.delete_all 
    sql = "DELETE FROM Items"
    SqlRunner.run_sql(sql)
  end
end
