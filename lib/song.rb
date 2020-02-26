
class Song
  
  attr_accessor :name,:genre,:artist
  
  extend Concerns::Findable
  extend Concerns::Findable::ClassMethods
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(name)
    self.new(name).tap do|song|
      song.save
    end
  end
  
  def save
    @@all << self
  end
  
  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end
  
  def artist=(artist)
    if @artist == nil
      @artist = artist
    end
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end
  
 def self.new_from_filename(name)
    song_name = name.split(" - ")[1]
    artist_name = name.split(" - ")[0]
    genre_name = name.split(" - ")[2].chomp(".mp3")
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end
  
 def self.create_from_filename(name)
    self.new_from_filename(name).tap{|song| song.save}
  end
  
end