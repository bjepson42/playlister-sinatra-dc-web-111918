class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres

  def slug
  	name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
  	Genre.all.select do |genre|
  		if genre.slug == slug
  			return genre
  		end
  	end
  end

end
