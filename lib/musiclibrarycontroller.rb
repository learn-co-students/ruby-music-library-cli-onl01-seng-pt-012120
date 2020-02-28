require 'pry'
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
      
      case com
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "list artist"
          list_songs_by_artist
        when "list genre"
          list_songs_by_genre
        when "play song"
          play_song
      end
    end
    
  end
  
  def list_songs
    songs_sorted_by_name = Song.all.sort{|song1,song2| song1.name <=> song2.name}
    songs_sorted_by_name.each.with_index(1){|song,index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def sorted_songs
    songs_sorted_by_name = Song.all.sort{|song1,song2| song1.name <=> song2.name}
    songs_sorted_by_name.collect.each.with_index(1){|song,index| song}
  end
  
  def list_artists
    artists_sorted_by_name = Artist.all.sort{|artist1,artist2| artist1.name <=> artist2.name}
    artists_sorted_by_name.each.with_index(1){|artist,index| puts "#{index}. #{artist.name}"}
  end
  
  def list_genres
    genres_sorted_by_name = Genre.all.sort{|genre1,genre2| genre1.name <=> genre2.name}
    genres_sorted_by_name.each.with_index(1){|genre,index| puts "#{index}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    artist_songs_sorted = Artist.find_or_create_by_name(artist).songs.sort{|song1,song2| song1.name <=> song2.name}
    artist_songs_sorted.each.with_index(1){|song,index| puts "#{index}. #{song.name} - #{song.genre.name}"}
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    genre_songs_sorted = Genre.find_or_create_by_name(genre).songs.sort{|song1,song2| song1.name <=> song2.name}
    genre_songs_sorted.each.with_index(1){|song,index| puts "#{index}. #{song.artist.name} - #{song.name}"}
  end
  
  def play_song
    puts "Which song number would you like to play?"
    i = gets.to_i
    if i > 0 && i <= Song.all.size
      puts "Playing #{sorted_songs[i-1].name} by #{sorted_songs[i-1].artist.name}"
    end
  end
end