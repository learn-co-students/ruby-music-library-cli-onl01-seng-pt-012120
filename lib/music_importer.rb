require 'pry'
class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
    #accepts a file path to parse MP3 files from
    #file = File.open #=> open file
    #file = file.read #=> to read file
    #file_data = File.read("user.txt").split #=> to open/close ur files
    #File.dirname("/tmp/ebook.pdf")
    #=> ^^ Get the path for this file, without the file name^^
  end
  
  def files
    Dir.entries(self.path).select {|file| file.end_with?("mp3")}
  end
  
end