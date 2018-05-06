class MoviesMovietype < ApplicationRecord
  belongs_to :movie
  belongs_to :movietype
  validates :movie_id, presence: true, uniqueness: true

  scope :join_movie_movietype, -> do
    joins(:movie, :movietype)
  end
end
