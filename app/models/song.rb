class Baz < ActiveRecord::Base
  has_many :baz_bars
  belongs_to :thud
  has_many :bars, through: :baz_bars

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
