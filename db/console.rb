require("pry")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({ 'name' => 'Metallica'})
artist1.save()

album1 = Album.new({
  'name' => 'Master of Puppets',
  'genre' => 'Thrash Metal',
  'artist_id' => artist1.id
  })
  album1.save()

  album2 = Album.new({
    'name' => 'Ride the Lightning',
    'genre' => 'Thrash Metal',
    'artist_id' => artist1.id
    })
    album2.save()

binding.pry
nil
