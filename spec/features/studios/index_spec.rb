require 'rails_helper'

RSpec.describe "Studio index Page" do

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
  end

  describe 'Story 1-lists all studios' do
    it 'includes the studios name and location' do
      visit (studios_path)
      save_and_open_page
      expect(page).to have_content(@warner.name)

      within("#studio-spec-#{@disney.id}") do
        expect(page).to_not have_content(@warner.name)

        expect(page).to have_content(@disney.name)
        expect(page).to have_content(@disney.location)
      end

    end

    describe "under each studio I see all of the studio's movies" do
      it "includes the movie's title, creation year, and genre" do
        visit (studios_path)
        expect(page).to have_content(@toy_story.title)

        within("#studio-spec-#{@disney.id}") do
          within("#movie_spec-#{@santa_clause.id}") do
            expect(page).to_not have_content(@toy_story.title)

            expect(page).to have_content(@santa_clause.title)
            expect(page).to have_content(@santa_clause.creation_year)
            expect(page).to have_content(@santa_clause.genre)
          end
        end
      end
    end
  end


end