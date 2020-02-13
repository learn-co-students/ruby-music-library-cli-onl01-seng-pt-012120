require 'pry'

class MusicLibraryController

  # include MusicImporter
  
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
  
  def files
    full_list = Dir.glob("#{@path}/*mp3")
    trimmed_list = []
    full_list.each do |file|
      trimmed_list << file.split("/")[-1]
    end
    # binding.pry
    trimmed_list
  end
  
  def list_songs
    files
    outer_arr = []
    files.each_with_index do |file, index|
      inner_arr = []
      # binding.pry
      title = file.split(Regexp.union(["-", "."]))[1].strip
      artist = file.split(Regexp.union(["-", "."]))[0].strip
      genre = file.split(Regexp.union(["-", "."]))[2].strip
      # puts "#{index + 1}. #{file.split('.mp3')}"
      inner_arr << title
      inner_arr << artist
      inner_arr << genre
      outer_arr << inner_arr
    end
    outer_arr.sort!
    ordered_arr = []
    outer_arr.each do |song_data|
      song_data[0], song_data[1] = song_data[1], song_data[0]
      song_data = song_data.join(" - ")
      ordered_arr << song_data
      binding.pry
    end
    
  end


end