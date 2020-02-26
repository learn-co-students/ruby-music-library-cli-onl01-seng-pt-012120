class MusicImporter
  attr_accessor(:path)
  
  def initialize(path)
    @path = path
  end
  
  def import()
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
  
  def files()
    filenames =  Dir.entries(@path).select do |file|
      file.include?(".mp3")
    end
    
    return filenames
  end
  
end