require "pry"


class Genre

extend Concerns::Findable

attr_accessor :name, :genre

@@all = []

def initialize(name)
    @name = name 
    @songs = []
end

def artists
    self.songs.map { |x| x.artist}.uniq
end

def songs
    @songs
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
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
end




end