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
    @@all << genre 
    genre
  end 
  
   def artists
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.artist)
        nil
      else
        @new_array << song.artist
      end
    end
    @new_array
  end
end 