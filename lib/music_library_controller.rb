class MusicLibraryController
  
  def initialize (path= './db/mp3s')
    MusicImporter.new(path).import
  end
  
  def call
    puts "Welcome to your music library!"  
    puts "To list all of your songs, enter 'list songs'."
    list_songs = gets.chomp
    puts "To list all of the artists in your library, enter 'list artists'."
    list_artists = gets.chomp
    puts "To list all of the genres in your library, enter 'list genres'."
    list_genres = gets.chomp
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    list_artist = gets.chomp
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    list_genre = gets.chomp
    puts "To play a song, enter 'play song'."
    play_song = gets.chomp
    puts "To quit, type 'exit'." 
    exit = gets.chomp
    puts "What would you like to do?"
    binding.pry
  end
  
  def call_loops
    
    call
  end

end
