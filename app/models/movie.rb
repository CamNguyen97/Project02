class Movie < ApplicationRecord
  belongs_to :studio, optional: true
  has_many :movie_movietypes, dependent: :destroy
  has_many :schedules, dependent: :destroy
  mount_uploader :image, ImageUploader

  scope :movie_select, -> do
    where(status: :t).order(year_produced: :desc)
    .limit Settings.model.movie.num_movie_show
  end

  def self.search search, id
    if search
      where(["name LIKE ?", "%#{search}%"])
    else
      scope
    end
  end
end
