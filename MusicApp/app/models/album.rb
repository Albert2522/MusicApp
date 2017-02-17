class Album < ActiveRecord::Base
  validates :band_id, :album_type, presence: true

  belongs_to :band

  has_many :tracks
end
