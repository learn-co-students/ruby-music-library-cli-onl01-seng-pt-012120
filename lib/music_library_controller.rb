class MusicLibraryController                                #class


def initialize(path = "./db/mp3s")                             #read me code to import all the songs
    MusicImporter.new(path).import
end

def call               # kinda like the main menu giving the user options
    input = ""
    while input != "exit"
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
            when "list artist"
                list_songs_by_artist
            when 'list genre'
                list_songs_by_genre
            when'play song'
                play_song
            end
        end
    end

        def list_songs                                                                          #lists the songs
        Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
          puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
        end

        def list_artists
        Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|                #liststhe artists when envoked
            puts "#{i}. #{a.name}"
        end
      end

    
        def list_genres 
        Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |g, i|                 #lists the genres
          puts "#{i}. #{g.name}"
        end
      end

      def list_songs_by_artist
        puts "Please enter the name of an artist:"                  #after getting name it finds the artist
        input = gets.strip
        if artist = Artist.find_by_name(input)                          #it prints the lists in abc order
            artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
                puts "#{i}. #{s.name} - #{s.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"                    #takes genre type amd prints the lists in order
        input = gets.strip
    
        if genre = Genre.find_by_name(input)
          genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
            puts "#{i}. #{s.artist.name} - #{s.name}"
          end
        end
      end

      def play_song                                                     #now you can choose a song
        puts "Which song number would you like to play?"
    
        input = gets.strip.to_i
        if (1..Song.all.length).include?(input)
          song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
        end
    
        puts "Playing #{song.name} by #{song.artist.name}" if song
      end

end
