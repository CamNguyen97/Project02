class MoviesMovietype < ApplicationRecord
  belongs_to :movie
  belongs_to :movietype

  scope :join_movie_movietype, -> do
    joins(:movie, :movietype)
  end
end
