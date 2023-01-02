class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.youngest_to_oldest
    order(:age)
  end

  def self.ave_age
    average(:age)
  end
end