class Movietype < ApplicationRecord
  has_many :movie_movietypes, dependent: :destroy
end
