# == Schema Information
#
# Table name: tracks
#
#  id               :integer          not null, primary key
#  album_id         :integer          not null
#  song_title       :string           not null
#  bonus_or_regular :string
#  lyrics           :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Track < ActiveRecord::Base
  validates :album_id, :song_title, presence: true

  belongs_to :album

  has_one :band, through: :album, source: :band
end
