require 'pry'
class Song 
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name
   # @artist = artist
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def self.create(song)
    song = self.new(name)
    song.save
    song
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
end
