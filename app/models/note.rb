class Note < ActiveRecord::Base
  validates :track_id, :user_id, :note_text, presence: true

  belongs_to :track,
    foreign_key: :track_id,
    primary_key: :id,
    class_name: "Track"

  belongs_to :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "User"
end
