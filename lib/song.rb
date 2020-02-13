require "pry"

class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end
  
  def genre=(genre)
    @genre = genre
    genre.save if !Genre.all.include?(genre)
    genre.songs << self if !genre.songs.include?(self)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
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
    song = Song.new(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create(name)
  end
  
  def self.new_from_filename(filename)
    name = filename.split(Regexp.union(["-", "."]))[1].strip
    song = Song.new(name) if !Song.find_by_name(name)
    artist = Artist.find_or_create_by_name(filename.split(Regexp.union(["-", "."]))[0].strip)
    genre = Genre.find_or_create_by_name(filename.split(Regexp.union(["-", "."]))[2].strip)
    song.artist = artist
    song.genre = genre
    song
  end
  
  def self.create_from_filename(filename)
    Song.new_from_filename(filename).save
  end

end