require 'rails_helper'

RSpec.describe "Movie show Page" do
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
  
    visit("/movies/#{@toy_story.id}")
  end

  describe 'Story 2 - Movie attributes' do
    it "lists the movie's title, creation year, and genre" do
      # visit("/movies/#{@toy_story.id}")
      expect(page).to have_content(@toy_story.title)
      expect(page).to have_content(@toy_story.creation_year)
      expect(page).to have_content(@toy_story.genre)
    end
    
    it "lists of all its actors from youngest to oldest" do
      # save_and_open_page
      expect(@shawn).to_not appear_before(@hanks)

      expect(@hanks).to appear_before(@allen)
      expect(@allen).to appear_before(@shawn)

  #** getting this error but code works: 
      # NoMethodError:
      #   undefined method `native' for #<Actor:0x00007fee53ca2468>
      #  ./.bundle/ruby/2.7.0/gems/orderly-0.1.1/lib/orderly.rb:22:in `html_for_node'
    end 
    
    it "displays the average age of all of the movie's actors" do
      expect(page).to have_content("Actors' Average Age: 71")
    end
  end

end