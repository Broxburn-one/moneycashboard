require( 'pg' )
require('time')
require('pry-byebug')
require_relative('../db/sql_runner')


class Merchant

  attr_reader(:id, :name)

  def initialize( options )
    @id = options['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO Merchants (name) VALUES ('#{ @name }')"
    SqlRunner.run_sql( sql )
    return last_entry()
  end

  def last_entry
    sql = "SELECT * FROM Merchants ORDER BY id DESC limit 1;"
    return Merchant.map_item(sql)
  end


  def self.find(id)
    sql = "SELECT * FROM Merchants WHERE id = #{id}"
    result = SqlRunner.run_sql( sql )
    merchants = SqlRunner.run_sql( sql )    
    merchant =  Merchant.new(result[0])
  end


  def self.all()
    sql = "SELECT * FROM Merchants"
    return Merchant.map_items(sql)
  end

  def update()
    sql = "UPDATE merchants SET name='#{ @name }' WHERE id = #{@id}"
    return SqlRunner.run_sql( sql )
  end






  def self.delete_all 
    sql = "DELETE FROM Merchants"
    SqlRunner.run_sql(sql)
  end

  def self.map_items(sql)
    merchant = SqlRunner.run_sql(sql)
    result = merchant.map { |m| Merchant.new( m ) }
    return result
  end

  def self.map_item(sql)
    result = Merchant.map_items(sql)
    return result.first
  end

end