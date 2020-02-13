require "pry"

class Artist
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
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    if !song.artist
      song.artist = self
    end
    @songs << song if !@songs.include?(song)
  end
  
  def genres
    # binding.pry
    genre_collection = []
    @songs.each do |song| 
      if !genre_collection.include?(song.genre)
        genre_collection << song.genre
      end
    end
    genre_collection
  end

end

