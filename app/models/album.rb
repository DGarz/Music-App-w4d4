# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  band_id        :integer          not null
#  title          :string           not null
#  live_or_studio :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Album < ActiveRecord::Base
  validates :band_id, :title, presence: true

  belongs_to :band

  has_many :tracks


end
