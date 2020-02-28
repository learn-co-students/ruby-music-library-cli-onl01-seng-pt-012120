require 'pry'
class Song
  
  attr_accessor :name
  attr_reader :genre,:artist
  
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
    
    song = new(name)
    song.save
    song
  end
  
  def save
    self.class.all << self #look here
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
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = new(song_name,artist,genre)
  end
  
 def self.create_from_filename(name)
    self.new_from_filename(name).tap{|song| song.save}
  end
    
    
end