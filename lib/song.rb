require "pry"

class Song

attr_accessor :name
attr_reader :artist, :genre

@@all = []

def initialize(name, artist_name = nil, genre = nil)
    @name = name
    @genre = genre
    self.genre = genre if genre
    self.artist = artist_name if artist_name #works like "unless artist_name = nil" or it passes the "nil" into artist=
end

def artist=(artist)
    @artist = artist
    artist.add_song(self)
end

def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  
end

def self.all
    @@all
end

def self.destroy_all
    @@all.clear
end

def save
    self.class.all << self
end

def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
end

def self.find_by_name(name)
    self.all.find { |x| x.name == name }
end

def self.find_or_create_by_name(name)
   if self.find_by_name(name)
        self.find_by_name(name)
   else
        self.create(name)
   end
end

def self.new_from_filename(filename)
    artist, song, genre = filename.sub(/\.mp3/, "").split(" - ") #artist = index[0], song = index[1], genre = index[2]
    new_song = Song.new(song) || find_by_name(song)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song 
end

def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
end
   




end