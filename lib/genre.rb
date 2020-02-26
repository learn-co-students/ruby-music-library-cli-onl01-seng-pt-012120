class Genre
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
    new_genre = Genre.new(name)
    @@all << new_genre
    return new_genre
  end
  
  def save()
    @@all << self
  end
  
  def add_song(song)
    if song.genre == nil
      song.genre = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  def artists()
    artists = @songs.collect do |song|
      song.artist
    end
    
    return artists.uniq()
  end
end