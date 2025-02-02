require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many :actor_movies}
    it {should have_many(:movies).through(:actor_movies)}
  end

  before(:each) do
    @disney = Studio.create!(name: "Walt Disney Pictures", location: "500 South Buena Vista Street, Burbank, California,USA")
    @warner = Studio.create!(name: "Warner Bros", location: "4000 Warner Blvd., Burbank, California, USA")
    
    @santa_clause = @disney.movies.create!(title: "The Santa Clause", creation_year: "1994", genre: "comedy")
    @toy_story = @disney.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")
    @dark_night = @warner.movies.create!(title: "The Dark Knight", creation_year: "2008", genre: "action")
    @polar_express = @warner.movies.create!(title: "The Polar Express", creation_year: "2004", genre: "animation")
    
    @allen = Actor.create!(name: "Tim Allen", age: 69)
    @bale = Actor.create!(name: "Christian Bale", age: 48)
    @freeman = Actor.create!(name: "Morgan Freeman", age: 85)
    @hanks = Actor.create!(name: "Tom Hanks", age: 66)
    @shawn = Actor.create!(name: "Wallace Shawn", age: 79)

    @allen_toy = ActorMovie.create!(actor: @allen, movie: @toy_story)
    @allen_santa = ActorMovie.create!(actor: @allen, movie: @santa_clause)
    @hanks_toy = ActorMovie.create!(actor: @hanks, movie: @toy_story)
    @shawn_toy = ActorMovie.create!(actor: @shawn, movie: @toy_story)
  end


  it 'lists actors youngest to oldest' do
    expect(Actor.youngest_to_oldest).to_not eq([@freeman, @shawn, @allen, @hanks, @bale])
    expect(Actor.youngest_to_oldest).to eq([@bale,@hanks, @allen, @shawn,@freeman])
  end

  it 'returns the average age of actors' do
    expect(Actor.ave_age).to_not eq(70)
    expect(Actor.ave_age.round).to eq(69)
  end
end