require 'pry'

class MusicLibraryController

  attr_accessor :path

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
      end
      input = gets.chomp
    end
  end
  
  def list_songs
    # CLI Methods #list_songs prints all songs in the music library in a numbered list (alphabetized by song name)
    # binding.pry
    full_list = Dir.glob("#{@path}/*mp3")
    trimmed_list = []
    full_list.each do |file|
      trimmed_list << file.split("/")[-1]
    end
    binding.pry
    trimmed_list
  end


end