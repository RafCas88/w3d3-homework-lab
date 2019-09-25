require('pg')
require_relative('artist')
require_relative('../db/sql_runner')

class Albums

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end


end