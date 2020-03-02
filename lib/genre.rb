class Genre 
  attr_accessor :name 
  
  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  @@all = []
  
  def songs 
    @songs
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(name)
    a = Genre.new(name)
    a.save
    a
  end
  
  def artists
    b = []
    @songs.each do |z|
      if z.artist == nil 
      elsif b.include?(z.artist)
      else
        b << z.artist
      end
    end
    b 
  end
  
end