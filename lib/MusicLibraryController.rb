require "pry"

class MusicLibraryController
  
  attr_accessor :path 
  
  def initialize(path = "./db/mp3s")
    @path = path 
    MusicImporter.new(path).import 
  end 
  
  def call
   imput = gets.strip 
   
   until imput = exit 
   puts "Welcome to your music library!"
   end 
  end 
  
  def list_songs
    Song.all.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort{|a, b| a.name <=> b.name}.each_with_index do |a, i|
     puts "#{i+1}. #{a.name}"
   end
  end
  
  def list_genres
    Genre.all.sort{|a, b| a.name <=> b.name}.each_with_index do |g, i|
     puts "#{i+1}. #{g.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    
    if artist = Artist.find_by_name(input)
      artist.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |a, i|
        puts "#{i+1}. #{a.name} - #{a.genre.name}"
      end
    end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |g, i|
        puts "#{i+1}. #{g.artist.name} - #{g.name}"
      end
    end 
  end 
[]
  def play_song 
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    songs = Song.all.sort{|a, b| a.name <=> b.name}
    if input > 0 && input <= songs.size
      song = songs[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end 
      
  end 
    
  
end 