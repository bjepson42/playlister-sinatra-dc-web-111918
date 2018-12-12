class Song < ActiveRecord::Base
  has_many :song_genres
  belongs_to :artist
  has_many :genres, through: :song_genres

  def slug
  	name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
  	Song.all.select do |song|
  		if song.slug == slug
  			return song
  		end
  	end
  end
end
