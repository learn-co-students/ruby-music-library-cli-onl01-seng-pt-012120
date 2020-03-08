require 'pry'
  module Concerns::Findable
    
  def find_by_name(name)
   # binding.pry
    all.detect do |x| x.name == name
   end
  end
  
  
  def find_or_create_by_name(name)
    find_by_name(name) || self.create(name)
    name
  end
  
end

#self.create(name)