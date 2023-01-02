class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    
    @movie_actors = @movie.actors.youngest_to_oldest
    @actors_average_age = @movie.actors.ave_age
  end
end