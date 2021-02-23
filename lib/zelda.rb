class Zelda
    @@all = []

    # initializes the zelda class using 
    # metaprogramming in order to use attributes as needed
    def initialize(data)
        data.each do |key, value| 
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        # 
        @@all << self
    end

end