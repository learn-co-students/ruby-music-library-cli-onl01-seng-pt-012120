

class Artist
  
  attr_accessor :name
  
  extend Concerns::Findable
  extend Concerns::Findable::ClassMethods
  
  @@all = []
  
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end

  
  def add_song(song)
    Song.find_or_create_by_name(song)
    if song.artist == nil
      song.artist = self
    end
    if @songs.include?(song) == false
      @songs << song
    end
  end
    
  
  def self.create(ins)
    ins = self.new(ins)
    ins.save
    ins
  end
  
  def save
    @@all << self
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs
    @songs
  end
  
  def genres
    @songs.collect{|song| song.genre}.uniq
  end
end