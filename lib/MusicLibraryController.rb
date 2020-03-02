require 'pry'
class MusicLibraryController 
  attr_accessor :path 
  def initialize(path = './db/mp3s')
    a = MusicImporter.new(path)
    a.import
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
    input = gets.strip
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
    when 'exit'
      
    else
      call
    end
  end
    
  def list_songs
    a = Song.all
    b = []
    a.each do |x|
      b << x.name
    end
    c = b.sort
    count = 1
    c.each do |z|
      y = Song.find_by_name(z)
      puts "#{count}. #{y.artist.name} - #{z} - #{y.genre.name}"
      count += 1
    end
  end
  
  def list_artists
    a = Artist.all
    b = []
    a.each do |x|
      b << x.name
    end
    c = b.sort
    count = 1 
    c.each do |z|
      puts "#{count}. #{z}"
      count += 1
    end
  end
  
  def list_genres 
    a = Genre.all 
    b = []
    a.each do |x|
      b << x.name 
    end
    c = b.sort 
    count = 1 
    c.each do |z|
      puts "#{count}. #{z}"
      count += 1 
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    if Artist.find_by_name(input) != nil 
      z = [] 
      a = Artist.find_by_name(input) 
      b = a.songs 
      b.each do |x| 
        z << x.name
      end
      y = z.sort
      count = 1 
      y.each do |k|
        v = Song.find_by_name(k)
        puts "#{count}. #{k} - #{v.genre.name}"
        count += 1 
      end
    end
  end
    
  def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    input = gets
    if Genre.find_by_name(input) != nil
      z = [] 
      a = Genre.find_by_name(input) 
      b = a.songs 
      b.each do |x| 
        z << x.name 
      end 
      y = z.sort 
      count = 1 
      y.each do |k|
        v = Song.find_by_name(k)
        puts "#{count}. #{v.artist.name} - #{k}"
        count += 1 
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input < Song.all.size && input > 0 || input == Song.all.size && input > 0
      musicarray = Song.all.sort{|a,b| a.name <=> b.name}
      song = musicarray[input - 1] 
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
end