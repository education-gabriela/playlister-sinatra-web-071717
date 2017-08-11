class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  include FriendlyId
  friendly_id :name, :use => :slugged
end