class Track < ActiveRecord::Base
  validates :name, :lyrics, :recording_type, :album_id, presence: true

  belongs_to :album,
    foreign_key: :album_id,
    primary_key: :id,
    class_name: "Album"

  has_many :notes,
    foreign_key: :track_id,
    primary_key: :id,
    class_name: "Note"

  has_one :band,
    through: :album,
    source: :band
end
