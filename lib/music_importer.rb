require 'pry'

class MusicImporter

  
  attr_accessor :path

  def initialize(path)
    @path = path
  end
  
  
  def files
    full_list = Dir.glob("#{@path}/*mp3")
    trimmed_list = []
    full_list.each do |file|
      trimmed_list << file.split("/")[-1]
    end
    trimmed_list
  end
  
  def import
    files.each do |file|
      # binding.pry
      Song.create_from_filename(file)
    end
  end

end