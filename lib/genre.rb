

class Genre
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs
    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
    end

    def artists
        songs.collect { |song| song.artist}.uniq
    end

    def add_song(song)                                          
        song.genre = self unless song.genre                   
        songs << song unless songs.include?(song)
    end

    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end

    def save 
        self.class.all << self
    end

    def self.create(name)
        song = new(name)
        song.save
        song
    end


end