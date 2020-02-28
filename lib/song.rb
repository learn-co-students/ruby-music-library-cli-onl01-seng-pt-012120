class Song  
  
attr_accessor :name, :artist, :genre 
attr_reader 

@@all = []

def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
end
  
def self.all 
  @@all
end 

def self.destroy_all
  self.all.clear
end 

def self.create(name) 
  song = self.new(name) 
  song.save
  song
end 

def save 
  @@all << self
end 

def artist=(artist)
  @artist = artist 
 artist.add_song(self) 
end 

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
end 

def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
end
  
def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
end  

 def self.new_from_filename(filename)
      file = filename.split(" - ")
      artist, name, genre = file[0], file[1], file[2].chomp(".mp3")
      artist = Artist.find_or_create_by_name(artist)
      genre  = Genre.find_or_create_by_name(genre)
      new(name,artist,genre)
    end 
    
  def self.create_from_filename(filename)
      file = new_from_filename(filename)
      file.save   
  end

end 