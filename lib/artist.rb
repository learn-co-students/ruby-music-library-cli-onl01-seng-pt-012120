require 'pry'
class Artist
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
   
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
  
  def self.create(artist)
    artist = self.new(name)
    artist.save
    artist
  end 
  
  
end
