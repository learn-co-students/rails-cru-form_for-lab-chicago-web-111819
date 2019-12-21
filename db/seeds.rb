# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Artist.destroy_all
Genre.destroy_all
Song.destroy_all

puts "Beginning seeding..."

artists, genres = [], []
10.times do
    artists << Artist.create(name: Faker::Name.name, bio: Faker::Lorem.sentences)
    genres << Genre.create(name: Faker::Music.genre)
end

20.times do
    Song.create(name: Faker::Music::Phish.song, artist_id: artists.sample.id, genre_id: genres.sample.id)
end

puts "Finished seeding..."

