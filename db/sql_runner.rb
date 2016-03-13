# require( 'pg' )

class SqlRunner

  def self.run_sql( sql )
    begin
      db = PG.connect({ dbname: 'moneycashboard', host: 'localhost' })
      result = db.exec( sql )
    ensure
      db.close
    end
    return result
  end

end