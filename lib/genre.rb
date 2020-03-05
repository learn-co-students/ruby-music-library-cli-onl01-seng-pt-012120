require 'pry'
class Genre
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def songs
    @songs
  end
  
  def save
    @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def self.create(genre)
    genre = self.new(name)
    genre.save
    genre
  end 
  
  def artists
    songs.collect(&:artist).uniq
  end
    
end
