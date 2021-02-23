class API

    def initialize
        @url = "https://zelda-api.apius.cc/api/games"
    end

    # Get all of the data from the api using httparty.
    def get_games_data
        series_hash = HTTParty.get(@url)
    end
end