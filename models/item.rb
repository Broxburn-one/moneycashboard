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


  def self.find(id)
    sql = "SELECT * FROM Items WHERE id = #{id}"
    items = SqlRunner.run_sql( sql )    
    return Item.new(items.first)
  end


  def self.all()
    sql = "SELECT * FROM Items"
    return Item.map_items(sql)
  end

#  create array of item objects
  def self.map_items(sql)
    item = SqlRunner.run_sql(sql)
    result = item.map { |name| Item.new( name ) }
    return result
  end

# return array of item names
  def self.map_item(sql)
    result = Item.map_items(sql)
    return result.first
  end

end