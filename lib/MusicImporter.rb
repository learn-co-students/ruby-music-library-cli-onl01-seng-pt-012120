class MusicImporter 
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.glob("#{@path}/*.mp3").map do |file|
      file.gsub("#{@path}/", "")
    end
  end
  
  def import
    self.files.each do |x|
      Song.create_from_filename(x)
    end
  end
end