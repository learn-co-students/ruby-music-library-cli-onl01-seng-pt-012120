require 'pry'
class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :songs
  
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
    genre = self.new(genre)
    genre.save
    genre
  end 
  
  def artists
   songs.collect {|song| song.artist}.uniq
   # songs.collect(&:artist).uniq 
    #binding.pry
  end
    
end
