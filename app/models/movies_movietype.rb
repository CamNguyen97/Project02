class MoviesMovietype < ApplicationRecord
  belongs_to :movie
  belongs_to :movietype
end
