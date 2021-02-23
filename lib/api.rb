class API

    def initialize
        @url = "https://zelda-api.apius.cc/api/games"
    end

    # Get all of the data from the api using httparty and creates instances of the zelda class as seperate games.
    def get_and_create_games
        series_hash = HTTParty.get(@url)
        if series_hash["success"] 
            series_hash = series_hash["data"]
            series_hash.each do |games|
                Zelda.new(games)
            end
        else
            self.get_and_create_games
        end
    end
end