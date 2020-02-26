module Concerns::Findable
  def find_by_name(name)
    return self.all.detect do |object|
      object.name == name
    end
  end
  
  def find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      new_object = self.create(name)
      return new_object
    else
      return self.find_by_name(name)
    end
  end
end