class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil 
      self.genre=(genre)
    end
  end
  
  @@all = []
  
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
    a = Song.new(name)
    a.save
    a
  end
  
  def self.find_by_name(song)
    @@all.find{|x| x.name == song}
  end
  
  def self.find_or_create_by_name(song)
    if self.find_by_name(song) == nil 
      self.create(song)
    else
      self.find_by_name(song)
    end
  end
  
  def artist=(artist)
    @artist = artist
    if artist.songs.include?(self) == false
      artist.add_song(self)
    end
  end
  
  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false 
      genre.songs << self
    end
  end
  
  def self.new_from_filename(name)
    a = name.split(" - ")
    b = []
    a.each do |x|
      if x == a[2]
        q = x.split(".")
        q.pop
        b << q.join
      else 
        b << x
      end
    end
    h = Artist.find_or_create_by_name(b[0])
    g = Genre.find_or_create_by_name(b[2])
    z = Song.new(b[1], h, g)
  end 
  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end
end