class Artist
  extend Concerns::Findable
  @@all = []
  attr_accessor(:name, :songs)
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all()
    return @@all
  end
  
  def self.destroy_all()
    @@all.clear
  end
  
  def self.create(name)
    new_artist = Artist.new(name)
    @@all << new_artist
    return new_artist
  end
  
  def save()
    @@all << self
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  def genres()
    genres = @songs.collect do |song|
      song.genre
    end
    
    return genres.uniq()
  end
end