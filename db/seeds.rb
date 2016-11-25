# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artist1 = Artist.create(name: 'Tame Impala', start: 2007, genre: 'Psychedellic Rock')
album1 = Album.create(name: 'Currents', year: 2015, artist_id: artist1.id)
song1 = Song.create(name: 'The Less I Know The Better', track: 7, length: '3:38', album_id: album1.id)