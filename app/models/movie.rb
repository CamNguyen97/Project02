class Movie < ApplicationRecord
  VALID_BROADCASTING_REGEX = /\A([4-9][0-9]|[1][0-2][0-9])\z/i
  belongs_to :studio, optional: true
  has_many :movie_movietypes, dependent: :destroy
  has_many :schedules, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :name, presence: true, uniqueness: true
  validates :broadcasting_time, presence: true, format: {with: VALID_BROADCASTING_REGEX}
  validates :descreption, presence: true
  validates :trailer, presence: true
  validates :studio_id, presence: true

  scope :movie_select, -> do
    where(status: :t).order(year_produced: :desc)
    .limit Settings.model.movie.num_movie_show
  end

  scope :movie_top3, -> do
    where(status: :t).order(year_produced: :desc)
    .limit 3
  end

  

  def self.search search, id
    if search
      where(["name LIKE ?", "%#{search}%"])
    end
  end
end
