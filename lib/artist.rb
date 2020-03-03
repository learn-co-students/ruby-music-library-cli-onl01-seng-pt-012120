require 'pry'
class Artist
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  
  def self.all
    @@all
  end
  
  def save
    @@all << self 
  end 
  
  def songs
    @songs
  end
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def self.create(artist)
    artist = Artist.new(name)
    artist.save
    artist
  end 
  
  def add_song
    Song.all.select do |songs|
      puts songs
    end
  end
  
  
end
