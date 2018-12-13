class Baz < ActiveRecord::Base
  has_many :baz_bars
  belongs_to :thud
  has_many :bars, through: :baz_bars

  def slug
    slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
  
end
