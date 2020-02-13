require "pry"

class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
  
  def artists
    artist_collection = []
    @songs.each do |song|
      if !artist_collection.include?(song.artist)
        artist_collection << song.artist
      end
    end
    artist_collection
  end

end