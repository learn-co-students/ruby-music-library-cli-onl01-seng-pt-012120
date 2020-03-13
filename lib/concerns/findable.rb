
module Concerns::Findable
    def find_by_name(name)
        all.detect {|song| song.name == name}
    end

    def find_or_create_by_name(name)                   # if the name issnt there it creates it
        find_by_name(name) || create(name)
    end
end