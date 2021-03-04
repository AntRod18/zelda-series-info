class Zelda
    @@all = []

    # initializes the zelda class using 
    # metaprogramming in order to use attributes as needed
    def initialize(data)
        data.each do |key, value| 
            # binding.pry
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(game_name)
        self.all.find {|game| game.name == game_name}
    end

   


end