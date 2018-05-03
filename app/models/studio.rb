class Studio < ApplicationRecord
  has_many :movies, dependent: :destroy

  scope :sort_alpha, -> do
  	Movie.joins(:studio).select("*, count(movies.id)")
  	.group("studio_id").limit(3)
  end
end
