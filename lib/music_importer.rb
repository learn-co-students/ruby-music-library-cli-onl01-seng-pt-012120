class MusicImporter
  
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end 
  
  def files
    files = Dir.glob("#{path}**/*").collect { |file| file.gsub("#{@path}/", "") } 
  end 
  
  def import 
    new_file = files.each {|file| Song.create_from_filename(file)}
  end 
   
end 