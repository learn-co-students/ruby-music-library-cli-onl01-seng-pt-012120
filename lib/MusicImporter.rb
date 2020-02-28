
class MusicImporter

 attr_reader :path #:files

  def initialize(path)
    @path = path
end



  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
  end

  def import
    files.each{|f| Song.create_from_filename(f)}
  end
end


# def music_importer
#   music_importer.path = ("./spec/fixtures/mp3s")
# end
