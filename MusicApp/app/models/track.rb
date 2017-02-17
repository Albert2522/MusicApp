class Track < ActiveRecord::Base
  validates :name, :album_id, :track_type, :lyrics, presence: true

  belongs_to :album
  has_one :band, through: :album, source: :band
end
