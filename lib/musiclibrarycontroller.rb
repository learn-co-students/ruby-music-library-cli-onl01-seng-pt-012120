
class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    new_path = MusicImporter.new(path)
    new_path.import
  end
  
  def call
    com = ""
    while com != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      com = gets.strip
    end
    
  end
  
  def list_songs
    songs_sorted_by_name = Song.all.sort{|song1,song2| song1.name <=> song2.name}
    songs_sorted_by_name.each_with_index(1){|song,index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
end