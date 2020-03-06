module Concerns::Findable
  
  def find_by_name(name)
    Song.all.find {|song| song.name == name}
  end
  
  def find_or_create_by_name(name)
    find_by_name(name) || name = Song.new(name)
   end
  
end