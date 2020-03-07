require 'pry'
  module Concerns::Findable
    
  def find_by_name(name)
    #binding.pry
     self.all.select do |x| x.name == name
    name
   end
  end
  
  
  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
    name
  end
  
end

#self.create(name)