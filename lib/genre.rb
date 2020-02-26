

class Genre
  
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
  
  def artists
    @songs.collect{|song| song.artist}.uniq
  end
  
end