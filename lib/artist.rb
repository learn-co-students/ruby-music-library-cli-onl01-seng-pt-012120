class Artist 
  attr_accessor :name 

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end
  
  @@all = []
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self
    end
    if @songs.include?(song) == false 
      @songs << song
    end
  end
  
  def songs 
    @songs 
  end
  
  def genres
    b = []
    @songs.each do |z|
      if z.genre == nil 
      elsif b.include?(z.genre)
      else
        b << z.genre
      end
    end
    b 
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
    a = Artist.new(name)
    a.save
    a
  end
  
end