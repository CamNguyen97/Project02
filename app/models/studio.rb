class Studio < ApplicationRecord
  has_many :movies, dependent: :destroy

  scope :sort_alpha, -> do
  	self.select("*, count(movie_id)").group("id")
  	  .order(movie_id: :desc).limit(3)
  end
end
