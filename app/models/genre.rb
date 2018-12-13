class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres

  def slug
    slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end
