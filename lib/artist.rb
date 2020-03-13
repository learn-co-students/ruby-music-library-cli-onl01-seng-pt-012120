

class Artist 
extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs 
    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
    end

    def genres
        songs.collect { |song| song.genre}.uniq
    end

    def add_song(song)                                          #assign the song to the artist instance of itself unless its been added
        song.artist = self unless song.artist                   # adds song unless song is already in the array
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