# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

disney = Studio.create!(name: "Walt Disney Pictures", location: "500 South Buena Vista Street, Burbank, California,USA")
universal = Studio.create!(name: "Universal City Studios", location: "10 Universal City Plaza, Universal City, California, USA")
warner = Studio.create!(name: "Warner Bros", location: "4000 Warner Blvd., Burbank, California, USA")

incredibles = disney.movies.create!(title: "The Incredibles", creation_year: "2004", genre: "animation")
lion_king = disney.movies.create!(title: "The Lion King", creation_year: "1994", genre: "animation")
santa_clause = disney.movies.create!(title: "The Santa Clause", creation_year: "1994", genre: "comedy")
toy_story = disney.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")

public_enemy = universal.movies.create!(title: "Public Enemies", creation_year: "2009", genre: "drama")
evan_almighty = universal.movies.create!(title: "Evan Almighty", creation_year: "2003", genre: "comedy")

dark_night = warner.movies.create!(title: "The Dark Knight", creation_year: "2008", genre: "action")
polar_express = warner.movies.create!(title: "The Polar Express", creation_year: "2004", genre: "animation")

allen = Actor.create!(name: "Tim Allen", age: 69)
bale = Actor.create!(name: "Christian Bale", age: 48)
depp = Actor.create!(name: "Johnny Depp", age: 59)
freeman = Actor.create!(name: "Morgan Freeman", age: 85)
hanks = Actor.create!(name: "Tom Hanks", age: 66)
jones = Actor.create!(name: "James Earl Jones", age: 91)
odenkirk = Actor.create!(name: "Bob Odenkirk", age: 60)