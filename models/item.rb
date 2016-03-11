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

end