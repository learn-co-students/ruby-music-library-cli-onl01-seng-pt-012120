require 'pry'

class MusicLibraryController

  
  attr_accessor :path
  attr_reader :list_of_songs

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    input = gets.chomp
    while input != "exit"
      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end
      input = gets.chomp
    end
  end
  
  def list_songs
    song_arr = Song.all.sort_by(&:name)
    song_arr.each_with_index do |song, index|
      # binding.pry
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    artist_arr = Artist.all.sort_by(&:name)
    artist_arr.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres_arr = Genre.all.sort_by(&:name)
    genres_arr.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.find_by_name(input)
      Artist.find_by_name(input).songs.sort_by(&:name).each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.find_by_name(input)
      Genre.find_by_name(input).songs.sort_by(&:name).each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    if input < Song.all.size && input > 0
      index = input - 1
      # binding.pry
      song = Song.all.sort_by(&:name)[index].name
      artist = Song.all.sort_by(&:name)[index].artist
      puts "Playing #{song} by #{artist.name}"
    end
  end


end