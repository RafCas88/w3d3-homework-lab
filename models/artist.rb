require('pg')
require_relative('album')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql =
    "INSERT INTO artists (name) VALUES ($1) RETURNING id"
      values = [@name]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i()
    end

    def delete()
      sql = "DELETE FROM artists where id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end


    def self.find(id)
        sql = "SELECT * FROM artists WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        artists_hash = results.first
        artist = Artist.new(artists_hash)
        return artist
    end


    def self.all()
      sql = "SELECT * FROM artists"
      artists = SqlRunner.run(sql)
      return artists.map { |artist| Artist.new(artist) }
    end

    def self.delete_all()
        sql = "DELETE FROM artists"
        SqlRunner.run(sql)
      end

end
