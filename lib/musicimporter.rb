class MusicImporter
  
  attr_accessor :path
  
  def initialize(file)
    @path = file
  end
  
  def files
    files = []
    Dir.new(self.path).each{|file| files << file if file.length > 4}
    files
  end
  
  def import()
    self.files.each{|file| Song.create_from_filename(file)}
  end
end